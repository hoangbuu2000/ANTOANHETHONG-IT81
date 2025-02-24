package com.dhb.springapp.controllers.admin;

import com.dhb.springapp.models.*;
import com.dhb.springapp.modelview.AddInvoice;
import com.dhb.springapp.modelview.AddPrescription;
import com.dhb.springapp.modelview.SearchInvoice;
import com.dhb.springapp.service.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@ControllerAdvice
@RequestMapping("/admin/invoice")
public class InvoiceController {
    @Autowired
    IHoaDonService iHoaDonService;
    @Autowired
    IToaThuocService iToaThuocService;
    @Autowired
    INhanVienService iNhanVienService;
    @Autowired
    ILoaiBenhService iLoaiBenhService;
    @Autowired
    ITaiKhoanService iTaiKhoanService;

    @ModelAttribute
    public void modelAttribute(ModelMap model, Principal principal) {
        model.addAttribute("prescriptions", iToaThuocService.getAll(ToaThuoc.class));
        if (principal != null) {
            TaiKhoan taiKhoan = iTaiKhoanService.getTaiKhoanByUsername(principal.getName());
            if (taiKhoan != null && taiKhoan.getRole().getTen().equals("ROLE_ADMIN"))
                model.addAttribute("employees", iNhanVienService.getAll(NhanVien.class));
            else if (taiKhoan != null && taiKhoan.getRole().getTen().equals("ROLE_EMPLOYEE")) {
                List<NhanVien> employees = new ArrayList<>();
                NhanVien nhanVien = iNhanVienService.getById(NhanVien.class, taiKhoan.getId());
                if (nhanVien != null)
                    employees.add(nhanVien);
                model.addAttribute("employees", employees);
            }
        }
    }

    @GetMapping()
    public String index(ModelMap model) {
        model.addAttribute("invoices", iHoaDonService.getAll(HoaDon.class));
        return "invoice.index";
    }

    @GetMapping("/addorupdate")
    public String addOrUpdateView(@RequestParam(value = "id", required = false)String id, ModelMap model) {
        if (id != null && !id.isEmpty()) {
            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
            model.addAttribute("invoice", iHoaDonService.castToModelView(
                    iHoaDonService.getById(HoaDon.class, id), format));
        }
        else {
            model.addAttribute("invoice", new AddInvoice());
        }

        return "invoice.add";
    }

    @PostMapping("/addorupdate")
    public String addOrUpdateProcess(@RequestParam(value = "id", required = false)String id,
                                     @ModelAttribute("invoice") @Valid AddInvoice addInvoice,
                                     BindingResult result, ModelMap model,
                                     @RequestParam(value = "lang", required = false)String lang) {
        if (!result.hasErrors()) {
            try {
                String str = "";
                if (lang != null && !lang.isEmpty())
                    str = "?lang="+lang;
                iHoaDonService.addOrUpdate(id, addInvoice,
                        new SimpleDateFormat("dd/MM/yyyy"));
                return String.format("redirect:/admin/invoice%s", str);
            }
            catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("message", "Toa thuốc này đã có hóa đơn");
            }
        }
        return "invoice.add";
    }

    @GetMapping("/api/getTienKham")
    public @ResponseBody String getTienKham(@RequestParam("idToaThuoc") String id) {
        ObjectMapper mapper = new ObjectMapper();
        String ajaxResponse = "";
        try {
            ajaxResponse = mapper.writeValueAsString(iToaThuocService.getById(ToaThuoc.class, id).getLoaiBenh().getDonGia());
        }
        catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return ajaxResponse;
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id")String id,
                         @RequestParam(value = "lang", required = false)String lang) {
        if (id != null && !id.isEmpty()) {
            try {
                String str = "";
                if (lang != null && !lang.isEmpty())
                    str = "?lang="+lang;
                iHoaDonService.delete(iHoaDonService.getById(HoaDon.class, id));
                return String.format("redirect:/admin/invoice%s", str);
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "404";
    }

    @GetMapping("/details")
    public String details(@RequestParam("id")String id, ModelMap model) {
        model.addAttribute("invoice", iHoaDonService.castToModelView(
                iHoaDonService.getById(HoaDon.class, id), new SimpleDateFormat("dd/MM/yyyy")));
        return "invoice.details";
    }

    @GetMapping("/search")
    public @ResponseBody String search(@RequestParam(value = "from", required = false)String from,
                                @RequestParam(value = "to", required = false)String to) {
        ObjectMapper mapper = new ObjectMapper();
        String ajaxResponse = "";
        if (!((from == null || from.isEmpty()) && (to == null || to.isEmpty()))) {
            try {
                List<SearchInvoice> result = new ArrayList<>();
                iHoaDonService.getHoaDonFromTo(from, to).forEach(h -> {
                    SearchInvoice hoaDon = new SearchInvoice();
                    hoaDon.setId(h.getId());
                    hoaDon.setTenBenhNhan(h.getToaThuoc().getBenhNhan().getTen());
                    hoaDon.setNgayXuat(h.getNgayXuat());
                    hoaDon.setTenNhanVien(h.getNhanVien().getTen());
                    hoaDon.setTongTien(h.getTongTien());
                    result.add(hoaDon);
                });
                ajaxResponse = mapper.writeValueAsString(result);
            }
            catch (JsonProcessingException | ParseException e) {
                e.printStackTrace();
            }
        }
        else {
            try {
                List<SearchInvoice> result = new ArrayList<>();
                iHoaDonService.getAll(HoaDon.class).forEach(h -> {
                    SearchInvoice hoaDon = new SearchInvoice();
                    hoaDon.setId(h.getId());
                    hoaDon.setTenBenhNhan(h.getToaThuoc().getBenhNhan().getTen());
                    hoaDon.setNgayXuat(h.getNgayXuat());
                    hoaDon.setTenNhanVien(h.getNhanVien().getTen());
                    hoaDon.setTongTien(h.getTongTien());
                    result.add(hoaDon);
                });
                ajaxResponse = mapper.writeValueAsString(result);
            }
            catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
        return ajaxResponse;
    }
}
