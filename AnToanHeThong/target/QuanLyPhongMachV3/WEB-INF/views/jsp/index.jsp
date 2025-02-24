<%--
  Created by IntelliJ IDEA.
  User: Buu
  Date: 02/03/2021
  Time: 8:16 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- Section: intro -->
<section id="intro" class="intro">
    <div class="intro-content">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="wow fadeInDown" data-wow-offset="0" data-wow-delay="0.1s">
                        <h2 class="h-ultra">Medicio medical group</h2>
                    </div>
                    <div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.1s">
                        <h4 class="h-light">Provide <span class="color">best quality healthcare</span> for you</h4>
                    </div>
                    <div class="well well-trans">
                        <div class="wow fadeInRight" data-wow-delay="0.1s">

                            <ul class="lead-list">
                                <li><span class="fa fa-check fa-2x icon-success"></span> <span class="list"><strong>Affordable monthly premium packages</strong><br />Lorem ipsum dolor sit amet, in verterem persecuti vix, sit te meis</span></li>
                                <li><span class="fa fa-check fa-2x icon-success"></span> <span class="list"><strong>Choose your favourite doctor</strong><br />Sit zril sanctus scaevola ei, ea usu movet graeco</span></li>
                                <li><span class="fa fa-check fa-2x icon-success"></span> <span class="list"><strong>Only use friendly environment</strong><br />Wisi lobortis eos ex, per at movet delectus, qui no vocent deleniti</span></li>
                            </ul>

                        </div>
                    </div>


                </div>
                <div class="col-lg-6">
                    <div class="form-wrapper">
                        <div class="wow fadeInRight" data-wow-duration="2s" data-wow-delay="0.2s">

                            <div class="panel panel-skin">
                                <div class="panel-heading">
                                    <h3 onclick="appointment()" style="cursor: pointer" class="panel-title"><span class="fa fa-pencil-square-o"></span> Make an appoinment <small>(It's free!)</small></h3>
                                    <a href="javascript:;" onclick="reExamination()"><h5 class="panel-title">re-examination?</h5></a>
                                </div>
                                <div class="panel-body">
                                    <form action="/re-examination" class="lead" style="display: none">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="id">ID</label>
                                                    <input name="id" id="id" class="form-control" required />
                                                </div>
                                                <div class="form-group">
                                                    <input type="submit" value="Submit" class="btn btn-primary" />
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <form:form id="form-appointment" onsubmit="return false;" method="post" action="/add" role="form" cssClass="lead" modelAttribute="appointment">
                                        <c:if test="${message != null}">
                                            <p class="alert alert-danger">${message}</p>
                                        </c:if>
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>First Name</label>
                                                    <form:input path="ten" cssClass="form-control input-md" />
                                                    <form:errors element="small" path="ten" cssClass="text-danger" />
<%--                                                    <input type="text" name="first_name" id="first_name" class="form-control input-md">--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Last Name</label>
                                                    <form:input path="ho" cssClass="form-control input-md" />
                                                    <form:errors element="small" path="ho" cssClass="text-danger" />
<%--                                                    <input type="text" name="last_name" id="last_name" class="form-control input-md">--%>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Tuoi</label>
                                                    <form:input type="number" path="tuoi" cssClass="form-control input-md" />
                                                    <form:errors element="small" path="tuoi" cssClass="text-danger" />
<%--                                                    <input type="email" name="email" id="email" class="form-control input-md">--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <form:input type="email" path="email" cssClass="form-control input-md" />
                                                    <form:errors element="small" path="email" cssClass="text-danger" />
<%--                                                    <input type="text" name="phone" id="phone" class="form-control input-md">--%>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>DOB</label>
                                                    <div class="cal-icon">
                                                        <form:input path="ngaySinh" cssClass="form-control datetimepicker" />
                                                    </div>
                                                    <form:errors element="small" path="ngaySinh" cssClass="text-danger" />
                                                        <%--                                                    <input type="email" name="email" id="email" class="form-control input-md">--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Gender</label>
                                                    <div class="form-check-inline">
                                                        <label class="form-check-label">
                                                            <form:radiobutton path="gioiTinh" value="Nam"
                                                                              name="gender" cssClass="form-check-input" checked="true" />
                                                            Male
                                                        </label>
                                                    </div>
                                                    <div class="form-check-inline">
                                                        <label class="form-check-label">
                                                            <form:radiobutton path="gioiTinh" value="Nữ"
                                                                              name="gender" cssClass="form-check-input" />
                                                            Female
                                                        </label>
                                                    </div>
                                                    <form:errors element="small" path="gioiTinh" cssClass="text-danger" />
                                                        <%--                                                    <input type="text" name="phone" id="phone" class="form-control input-md">--%>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Phone number</label>
                                                    <form:input path="dienThoai" cssClass="form-control input-md" />
                                                    <form:errors element="small" path="dienThoai" cssClass="text-danger" />
                                                        <%--                                                    <input type="email" name="email" id="email" class="form-control input-md">--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Date</label>
                                                    <div class="cal-icon">
                                                        <form:input onchange="pickDate(this)" onmouseout="pickDate(this)" path="ngayKham" cssClass="form-control datetimepicker" />
                                                    </div>
                                                    <form:errors element="small" path="ngayKham" cssClass="text-danger" />
                                                        <%--                                                    <input type="text" name="phone" id="phone" class="form-control input-md">--%>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Shift</label>
                                                    <form:select onchange="getJson()" path="caKham" cssClass="form-control select">
                                                        <form:option value="" label="Choose your shift" />
                                                    </form:select>
                                                    <form:errors element="small" path="caKham" cssClass="text-danger" />
                                                        <%--                                                    <input type="email" name="email" id="email" class="form-control input-md">--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor</label>
                                                    <form:select path="bacSi" cssClass="form-control select">
                                                        <form:option value="" label="Choose your doctor" />
                                                    </form:select>
                                                    <form:errors element="small" path="bacSi" cssClass="text-danger" />
                                                        <%--                                                    <input type="text" name="phone" id="phone" class="form-control input-md">--%>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Disease</label>
                                                    <form:select multiple="true" path="loaiBenhList" cssClass="form-control select">
                                                        <c:forEach items="${danhSachLoaiBenh}" var="benh">
                                                            <form:option value="${benh.id}" label="${benh.tenBenh}" title="${benh.moTa}" />
                                                        </c:forEach>
                                                    </form:select>
                                                    <form:errors element="small" path="loaiBenhList" cssClass="text-danger" />
                                                        <%--                                                    <input type="text" name="phone" id="phone" class="form-control input-md">--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Payment</label>
                                                    <div class="form-check form-check-inline">
                                                        <form:radiobutton path="thanhToan" cssClass="form-check-input" value="true"
                                                                          id="patient_paid" name="payment" checked="true"/>
                                                        <label class="form-check-label" for="patient_paid">
                                                            Pay now
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <form:radiobutton path="thanhToan" cssClass="form-check-input" value="false"
                                                                          id="patient_notpaid" name="payment"/>
                                                        <label class="form-check-label" for="patient_notpaid">
                                                            Pay later
                                                        </label>
                                                    </div>
                                                    <form:errors element="small" path="thanhToan" cssClass="text-danger" />
                                                </div>
                                            </div>
                                        </div>

                                        <input onclick="checkPayment()" type="submit" value="Submit" class="btn btn-skin btn-block btn-lg" />

                                        <p class="lead-footer">* We'll contact you by phone & email later</p>

                                    </form:form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Modal -->
<div class="modal fade" id="details" tabindex="-1" role="dialog" aria-labelledby="detailsTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="detailsTitle">PAYMENT ONLINE</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h5>INFORMATION</h5>
                <p style="margin-top: 10px" class="text-danger"></p>
                <div class="modal-body__img text-center">
                    <figure>
                        <img src="https://res.cloudinary.com/dk5jgf3xj/image/upload/v1620780053/payment/momo_e2h3qs.jpg" alt="No Image">
                        <figcaption class="text-danger">Scan this QR code and transfer the full of total amount</figcaption>
                    </figure>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="submitForm()" class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<!-- /Section: intro -->

<!-- Section: boxes -->
<section id="boxes" class="home-section paddingtop-80">

    <div class="container">
        <div class="row">
            <div class="col-sm-3 col-md-3">
                <div class="wow fadeInUp" data-wow-delay="0.2s">
                    <div class="box text-center">

                        <i class="fa fa-check fa-3x circled bg-skin"></i>
                        <h4 class="h-bold">Make an appoinment</h4>
                        <p>
                            Lorem ipsum dolor sit amet, nec te mollis utroque honestatis, ut utamur molestiae vix, graecis eligendi ne.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-3 col-md-3">
                <div class="wow fadeInUp" data-wow-delay="0.2s">
                    <div class="box text-center">

                        <i class="fa fa-list-alt fa-3x circled bg-skin"></i>
                        <h4 class="h-bold">Choose your package</h4>
                        <p>
                            Lorem ipsum dolor sit amet, nec te mollis utroque honestatis, ut utamur molestiae vix, graecis eligendi ne.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-3 col-md-3">
                <div class="wow fadeInUp" data-wow-delay="0.2s">
                    <div class="box text-center">
                        <i class="fa fa-user-md fa-3x circled bg-skin"></i>
                        <h4 class="h-bold">Help by specialist</h4>
                        <p>
                            Lorem ipsum dolor sit amet, nec te mollis utroque honestatis, ut utamur molestiae vix, graecis eligendi ne.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-3 col-md-3">
                <div class="wow fadeInUp" data-wow-delay="0.2s">
                    <div class="box text-center">

                        <i class="fa fa-hospital-o fa-3x circled bg-skin"></i>
                        <h4 class="h-bold">Get diagnostic report</h4>
                        <p>
                            Lorem ipsum dolor sit amet, nec te mollis utroque honestatis, ut utamur molestiae vix, graecis eligendi ne.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
<!-- /Section: boxes -->


<section id="callaction" class="home-section paddingtop-40">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="callaction bg-gray">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="wow fadeInUp" data-wow-delay="0.1s">
                                <div class="cta-text">
                                    <h3>In an emergency? Need help now?</h3>
                                    <p>Lorem ipsum dolor sit amet consectetur adipiscing elit uisque interdum ante eget faucibus. </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="wow lightSpeedIn" data-wow-delay="0.1s">
                                <div class="cta-btn">
                                    <a href="#" class="btn btn-skin btn-lg">Book an appoinment</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- Section: services -->
<section id="service" class="home-section nopadding paddingtop-60">

    <div class="container">

        <div class="row">
            <div class="col-sm-6 col-md-6">
                <div class="wow fadeInUp" data-wow-delay="0.2s">
                    <img src="<c:url value="/resources/client/img/dummy/img-1.jpg" />" class="img-responsive" alt="" />
                </div>
            </div>
            <div class="col-sm-3 col-md-3">

                <div class="wow fadeInRight" data-wow-delay="0.1s">
                    <div class="service-box">
                        <div class="service-icon">
                            <span class="fa fa-stethoscope fa-3x"></span>
                        </div>
                        <div class="service-desc">
                            <h5 class="h-light">Medical checkup</h5>
                            <p>Vestibulum tincidunt enim in pharetra malesuada.</p>
                        </div>
                    </div>
                </div>

                <div class="wow fadeInRight" data-wow-delay="0.2s">
                    <div class="service-box">
                        <div class="service-icon">
                            <span class="fa fa-wheelchair fa-3x"></span>
                        </div>
                        <div class="service-desc">
                            <h5 class="h-light">Nursing Services</h5>
                            <p>Vestibulum tincidunt enim in pharetra malesuada.</p>
                        </div>
                    </div>
                </div>
                <div class="wow fadeInRight" data-wow-delay="0.3s">
                    <div class="service-box">
                        <div class="service-icon">
                            <span class="fa fa-plus-square fa-3x"></span>
                        </div>
                        <div class="service-desc">
                            <h5 class="h-light">Pharmacy</h5>
                            <p>Vestibulum tincidunt enim in pharetra malesuada.</p>
                        </div>
                    </div>
                </div>


            </div>
            <div class="col-sm-3 col-md-3">

                <div class="wow fadeInRight" data-wow-delay="0.1s">
                    <div class="service-box">
                        <div class="service-icon">
                            <span class="fa fa-h-square fa-3x"></span>
                        </div>
                        <div class="service-desc">
                            <h5 class="h-light">Gyn Care</h5>
                            <p>Vestibulum tincidunt enim in pharetra malesuada.</p>
                        </div>
                    </div>
                </div>

                <div class="wow fadeInRight" data-wow-delay="0.2s">
                    <div class="service-box">
                        <div class="service-icon">
                            <span class="fa fa-filter fa-3x"></span>
                        </div>
                        <div class="service-desc">
                            <h5 class="h-light">Neurology</h5>
                            <p>Vestibulum tincidunt enim in pharetra malesuada.</p>
                        </div>
                    </div>
                </div>
                <div class="wow fadeInRight" data-wow-delay="0.3s">
                    <div class="service-box">
                        <div class="service-icon">
                            <span class="fa fa-user-md fa-3x"></span>
                        </div>
                        <div class="service-desc">
                            <h5 class="h-light">Sleep Center</h5>
                            <p>Vestibulum tincidunt enim in pharetra malesuada.</p>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</section>
<!-- /Section: services -->


<!-- Section: team -->
<section id="doctor" class="home-section bg-gray paddingbot-60">
    <div class="container marginbot-50">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <div class="wow fadeInDown" data-wow-delay="0.1s">
                    <div class="section-heading text-center">
                        <h2 class="h-bold">Doctors</h2>
                        <p>Ea melius ceteros oportere quo, pri habeo viderer facilisi ei</p>
                    </div>
                </div>
                <div class="divider-short"></div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-12">

                <div id="filters-container" class="cbp-l-filters-alignLeft">
                    <div data-filter="*" class="cbp-filter-item-active cbp-filter-item">All (<div class="cbp-filter-counter"></div>)</div>
                    <div data-filter=".cardiologist" class="cbp-filter-item">Cardiologist (<div class="cbp-filter-counter"></div>)</div>
                    <div data-filter=".psychiatrist" class="cbp-filter-item">Psychiatrist (<div class="cbp-filter-counter"></div>)</div>
                    <div data-filter=".neurologist" class="cbp-filter-item">Neurologist (<div class="cbp-filter-counter"></div>)</div>
                </div>

                <div id="grid-container" class="cbp-l-grid-team">
                    <ul>
                        <li class="cbp-item psychiatrist">
                            <a href="doctors/member1.html" class="cbp-caption cbp-singlePage">
                                <div class="cbp-caption-defaultWrap">
                                    <img src="<c:url value="/resources/client/img/team/1.jpg" />" alt="" width="100%">
                                </div>
                                <div class="cbp-caption-activeWrap">
                                    <div class="cbp-l-caption-alignCenter">
                                        <div class="cbp-l-caption-body">
                                            <div class="cbp-l-caption-text">VIEW PROFILE</div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="doctors/member1.html" class="cbp-singlePage cbp-l-grid-team-name">Alice Grue</a>
                            <div class="cbp-l-grid-team-position">Psychiatrist</div>
                        </li>
                        <li class="cbp-item cardiologist">
                            <a href="doctors/member2.html" class="cbp-caption cbp-singlePage">
                                <div class="cbp-caption-defaultWrap">
                                    <img src="<c:url value="/resources/client/img/team/2.jpg" />" alt="" width="100%">
                                </div>
                                <div class="cbp-caption-activeWrap">
                                    <div class="cbp-l-caption-alignCenter">
                                        <div class="cbp-l-caption-body">
                                            <div class="cbp-l-caption-text">VIEW PROFILE</div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="doctors/member2.html" class="cbp-singlePage cbp-l-grid-team-name">Joseph Murphy</a>
                            <div class="cbp-l-grid-team-position">Cardiologist</div>
                        </li>
                        <li class="cbp-item cardiologist">
                            <a href="doctors/member3.html" class="cbp-caption cbp-singlePage">
                                <div class="cbp-caption-defaultWrap">
                                    <img src="<c:url value="/resources/client/img/team/3.jpg" />" alt="" width="100%">
                                </div>
                                <div class="cbp-caption-activeWrap">
                                    <div class="cbp-l-caption-alignCenter">
                                        <div class="cbp-l-caption-body">
                                            <div class="cbp-l-caption-text">VIEW PROFILE</div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="doctors/member3.html" class="cbp-singlePage cbp-l-grid-team-name">Alison Davis</a>
                            <div class="cbp-l-grid-team-position">Cardiologist</div>
                        </li>
                        <li class="cbp-item neurologist">
                            <a href="doctors/member4.html" class="cbp-caption cbp-singlePage">
                                <div class="cbp-caption-defaultWrap">
                                    <img src="<c:url value="/resources/client/img/team/4.jpg" />" alt="" width="100%">
                                </div>
                                <div class="cbp-caption-activeWrap">
                                    <div class="cbp-l-caption-alignCenter">
                                        <div class="cbp-l-caption-body">
                                            <div class="cbp-l-caption-text">VIEW PROFILE</div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="doctors/member4.html" class="cbp-singlePage cbp-l-grid-team-name">Adam Taylor</a>
                            <div class="cbp-l-grid-team-position">Neurologist</div>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>

</section>
<!-- /Section: team -->



<!-- Section: works -->
<section id="facilities" class="home-section paddingbot-60">
    <div class="container marginbot-50">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <div class="wow fadeInDown" data-wow-delay="0.1s">
                    <div class="section-heading text-center">
                        <h2 class="h-bold">Our facilities</h2>
                        <p>Ea melius ceteros oportere quo, pri habeo viderer facilisi ei</p>
                    </div>
                </div>
                <div class="divider-short"></div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12" >
                <div class="wow bounceInUp" data-wow-delay="0.2s">
                    <div id="owl-works" class="owl-carousel">
                        <div class="item"><a href="img/photo/1.jpg" title="This is an image title" data-lightbox-gallery="gallery1" data-lightbox-hidpi="img/works/1@2x.jpg"><img src="<c:url value="/resources/client/img/photo/1.jpg" />" class="img-responsive" alt="img"></a></div>
                        <div class="item"><a href="img/photo/2.jpg" title="This is an image title" data-lightbox-gallery="gallery1" data-lightbox-hidpi="img/works/2@2x.jpg"><img src="<c:url value="/resources/client/img/photo/2.jpg" />" class="img-responsive " alt="img"></a></div>
                        <div class="item"><a href="img/photo/3.jpg" title="This is an image title" data-lightbox-gallery="gallery1" data-lightbox-hidpi="img/works/3@2x.jpg"><img src="<c:url value="/resources/client/img/photo/3.jpg" />" class="img-responsive " alt="img"></a></div>
                        <div class="item"><a href="img/photo/4.jpg" title="This is an image title" data-lightbox-gallery="gallery1" data-lightbox-hidpi="img/works/4@2x.jpg"><img src="<c:url value="/resources/client/img/photo/4.jpg" />" class="img-responsive " alt="img"></a></div>
                        <div class="item"><a href="img/photo/5.jpg" title="This is an image title" data-lightbox-gallery="gallery1" data-lightbox-hidpi="img/works/5@2x.jpg"><img src="<c:url value="/resources/client/img/photo/5.jpg" />" class="img-responsive " alt="img"></a></div>
                        <div class="item"><a href="img/photo/6.jpg" title="This is an image title" data-lightbox-gallery="gallery1" data-lightbox-hidpi="img/works/6@2x.jpg"><img src="<c:url value="/resources/client/img/photo/6.jpg" />" class="img-responsive " alt="img"></a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /Section: works -->


<!-- Section: testimonial -->
<section id="testimonial" class="home-section paddingbot-60 parallax" data-stellar-background-ratio="0.5">

    <div class="carousel-reviews broun-block">
        <div class="container">
            <div class="row">
                <div id="carousel-reviews" class="carousel slide" data-ride="carousel">

                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="col-md-4 col-sm-6">
                                <div class="block-text rel zmin">
                                    <a title="" href="#">Emergency Contraception</a>
                                    <div class="mark">My rating: <span class="rating-input"><span data-value="0" class="glyphicon glyphicon-star"></span><span data-value="1" class="glyphicon glyphicon-star"></span><span data-value="2" class="glyphicon glyphicon-star"></span><span data-value="3" class="glyphicon glyphicon-star"></span><span data-value="4" class="glyphicon glyphicon-star-empty"></span><span data-value="5" class="glyphicon glyphicon-star-empty"></span>  </span></div>
                                    <p>Ne eam errem semper. Laudem detracto phaedrum cu vim, pri cu errem fierent fabellas. Quis magna in ius, pro vidit nonumy te, nostrud ...</p>
                                    <ins class="ab zmin sprite sprite-i-triangle block"></ins>
                                </div>
                                <div class="person-text rel text-light">
                                    <img src="<c:url value="/resources/client/img/testimonials/1.jpg" />" alt="" class="person img-circle" />
                                    <a title="" href="#">Anna</a>
                                    <span>Chicago, Illinois</span>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6 hidden-xs">
                                <div class="block-text rel zmin">
                                    <a title="" href="#">Orthopedic Surgery</a>
                                    <div class="mark">My rating: <span class="rating-input"><span data-value="0" class="glyphicon glyphicon-star"></span><span data-value="1" class="glyphicon glyphicon-star"></span><span data-value="2" class="glyphicon glyphicon-star-empty"></span><span data-value="3" class="glyphicon glyphicon-star-empty"></span><span data-value="4" class="glyphicon glyphicon-star-empty"></span><span data-value="5" class="glyphicon glyphicon-star-empty"></span>  </span></div>
                                    <p>Ne eam errem semper. Laudem detracto phaedrum cu vim, pri cu errem fierent fabellas. Quis magna in ius, pro vidit nonumy te, nostrud ...</p>
                                    <ins class="ab zmin sprite sprite-i-triangle block"></ins>
                                </div>
                                <div class="person-text rel text-light">
                                    <img src="<c:url value="/resources/client/img/testimonials/2.jpg" />" alt="" class="person img-circle" />
                                    <a title="" href="#">Matthew G</a>
                                    <span>San Antonio, Texas</span>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6 hidden-sm hidden-xs">
                                <div class="block-text rel zmin">
                                    <a title="" href="#">Medical consultation</a>
                                    <div class="mark">My rating: <span class="rating-input"><span data-value="0" class="glyphicon glyphicon-star"></span><span data-value="1" class="glyphicon glyphicon-star"></span><span data-value="2" class="glyphicon glyphicon-star"></span><span data-value="3" class="glyphicon glyphicon-star"></span><span data-value="4" class="glyphicon glyphicon-star"></span><span data-value="5" class="glyphicon glyphicon-star"></span>  </span></div>
                                    <p>Ne eam errem semper. Laudem detracto phaedrum cu vim, pri cu errem fierent fabellas. Quis magna in ius, pro vidit nonumy te, nostrud ...</p>
                                    <ins class="ab zmin sprite sprite-i-triangle block"></ins>
                                </div>
                                <div class="person-text rel text-light">
                                    <img src="<c:url value="/resources/client/img/testimonials/3.jpg" />" alt="" class="person img-circle" />
                                    <a title="" href="#">Scarlet Smith</a>
                                    <span>Dallas, Texas</span>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-md-4 col-sm-6">
                                <div class="block-text rel zmin">
                                    <a title="" href="#">Birth control pills</a>
                                    <div class="mark">My rating: <span class="rating-input"><span data-value="0" class="glyphicon glyphicon-star"></span><span data-value="1" class="glyphicon glyphicon-star"></span><span data-value="2" class="glyphicon glyphicon-star"></span><span data-value="3" class="glyphicon glyphicon-star"></span><span data-value="4" class="glyphicon glyphicon-star-empty"></span><span data-value="5" class="glyphicon glyphicon-star-empty"></span>  </span></div>
                                    <p>Ne eam errem semper. Laudem detracto phaedrum cu vim, pri cu errem fierent fabellas. Quis magna in ius, pro vidit nonumy te, nostrud ...</p>
                                    <ins class="ab zmin sprite sprite-i-triangle block"></ins>
                                </div>
                                <div class="person-text rel text-light">
                                    <img src="<c:url value="/resources/client/img/testimonials/4.jpg" />" alt="" class="person img-circle" />
                                    <a title="" href="#">Lucas Thompson</a>
                                    <span>Austin, Texas</span>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6 hidden-xs">
                                <div class="block-text rel zmin">
                                    <a title="" href="#">Radiology</a>
                                    <div class="mark">My rating: <span class="rating-input"><span data-value="0" class="glyphicon glyphicon-star"></span><span data-value="1" class="glyphicon glyphicon-star"></span><span data-value="2" class="glyphicon glyphicon-star-empty"></span><span data-value="3" class="glyphicon glyphicon-star-empty"></span><span data-value="4" class="glyphicon glyphicon-star-empty"></span><span data-value="5" class="glyphicon glyphicon-star-empty"></span>  </span></div>
                                    <p>Ne eam errem semper. Laudem detracto phaedrum cu vim, pri cu errem fierent fabellas. Quis magna in ius, pro vidit nonumy te, nostrud ...</p>
                                    <ins class="ab zmin sprite sprite-i-triangle block"></ins>
                                </div>
                                <div class="person-text rel text-light">
                                    <img src="<c:url value="/resources/client/img/testimonials/5.jpg" />" alt="" class="person img-circle" />
                                    <a title="" href="#">Ella Mentree</a>
                                    <span>Fort Worth, Texas</span>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6 hidden-sm hidden-xs">
                                <div class="block-text rel zmin">
                                    <a title="" href="#">Cervical Lesions</a>
                                    <div class="mark">My rating: <span class="rating-input"><span data-value="0" class="glyphicon glyphicon-star"></span><span data-value="1" class="glyphicon glyphicon-star"></span><span data-value="2" class="glyphicon glyphicon-star"></span><span data-value="3" class="glyphicon glyphicon-star"></span><span data-value="4" class="glyphicon glyphicon-star"></span><span data-value="5" class="glyphicon glyphicon-star"></span>  </span></div>
                                    <p>Ne eam errem semper. Laudem detracto phaedrum cu vim, pri cu errem fierent fabellas. Quis magna in ius, pro vidit nonumy te, nostrud ...</p>
                                    <ins class="ab zmin sprite sprite-i-triangle block"></ins>
                                </div>
                                <div class="person-text rel text-light">
                                    <img src="<c:url value="/resources/client/img/testimonials/6.jpg" />" alt="" class="person img-circle" />
                                    <a title="" href="#">Suzanne Adam</a>
                                    <span>Detroit, Michigan</span>
                                </div>
                            </div>
                        </div>


                    </div>

                    <a class="left carousel-control" href="#carousel-reviews" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-reviews" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /Section: testimonial -->


<!-- Section: pricing -->
<section id="pricing" class="home-section bg-gray paddingbot-60">
    <div class="container marginbot-50">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <div class="wow lightSpeedIn" data-wow-delay="0.1s">
                    <div class="section-heading text-center">
                        <h2 class="h-bold">Health packages</h2>
                        <p>Take charge of your health today with our specially designed health packages</p>
                    </div>
                </div>
                <div class="divider-short"></div>
            </div>
        </div>
    </div>

    <div class="container">

        <div class="row">

            <div class="col-sm-4 pricing-box">
                <div class="wow bounceInUp" data-wow-delay="0.1s">
                    <div class="pricing-content general">
                        <h2>Basic Fit 1 Package</h2>
                        <h3>$33<sup>.99</sup> <span>/ one time</span></h3>
                        <ul>
                            <li>Anthropometry (BMI, WH Ratio) <i class="fa fa-check icon-success"></i></li>
                            <li>Post Examination Review <i class="fa fa-check icon-success"></i></li>
                            <li>General Screening – Basic <i class="fa fa-check icon-success"></i></li>
                            <li><del>Health Screening Report</del> <i class="fa fa-times icon-danger"></i></li>
                        </ul>

                        <div class="price-bottom">
                            <a href="#" class="btn btn-skin btn-lg">Purchase</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-4 pricing-box featured-price">
                <div class="wow bounceInUp" data-wow-delay="0.3s">
                    <div class="pricing-content featured">
                        <h2>Golden Glow Package</h2>
                        <h3>$65<sup>.99</sup> <span>/ one time</span></h3>
                        <ul>
                            <li>Anthropometry (BMI, WH Ratio) <i class="fa fa-check icon-success"></i></li>
                            <li>Post Examination Review <i class="fa fa-check icon-success"></i></li>
                            <li>General Screening – Basic <i class="fa fa-check icon-success"></i></li>
                            <li>Body Composition Analysis <i class="fa fa-check icon-success"></i></li>
                            <li>GR Assessment & Scoring <i class="fa fa-check icon-success"></i></li>
                        </ul>

                        <div class="price-bottom">
                            <a href="#" class="btn btn-skin btn-lg">Purchase</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-4 pricing-box">
                <div class="wow bounceInUp" data-wow-delay="0.2s">
                    <div class="pricing-content general last">
                        <h2>Basic Fit 2 Package</h2>
                        <h3>$47<sup>.99</sup> <span>/ one time</span></h3>
                        <ul>
                            <li>Anthropometry (BMI, WH Ratio) <i class="fa fa-check icon-success"></i></li>
                            <li>Post Examination Review <i class="fa fa-check icon-success"></i></li>
                            <li>General Screening – Regular <i class="fa fa-check icon-success"></i></li>
                            <li><del>Health Screening Report</del> <i class="fa fa-times icon-danger"></i></li>
                        </ul>

                        <div class="price-bottom">
                            <a href="#" class="btn btn-skin btn-lg">Purchase</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</section>
<!-- /Section: pricing -->

<section id="partner" class="home-section paddingbot-60">
    <div class="container marginbot-50">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <div class="wow lightSpeedIn" data-wow-delay="0.1s">
                    <div class="section-heading text-center">
                        <h2 class="h-bold">Our partner</h2>
                        <p>Take charge of your health today with our specially designed health packages</p>
                    </div>
                </div>
                <div class="divider-short"></div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-3">
                <div class="partner">
                    <a href="#"><img src="<c:url value="/resources/client/img/dummy/partner-1.jpg" />" alt="" /></a>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="partner">
                    <a href="#"><img src="<c:url value="/resources/client/img/dummy/partner-2.jpg" />" alt="" /></a>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="partner">
                    <a href="#"><img src="<c:url value="/resources/client/img/dummy/partner-3.jpg" />" alt="" /></a>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="partner">
                    <a href="#"><img src="<c:url value="/resources/client/img/dummy/partner-4.jpg" />" alt="" /></a>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    function pickDate(obj) {
        if (obj.value != "" && moment(obj.value, "DD/MM/YYYY").isValid()) {
            let caKham = document.querySelector("select[name=caKham]");
            caKham.options.length = 0;

            let ngayKham = $("#ngayKham").val();

            getJson1(caKham, ngayKham);
        }
    }

    function getJson() {
        let ngayKham = $("#ngayKham").val();
        let shift = $("#caKham").val();
        let bacSi = document.querySelector("select[name=bacSi]");
        bacSi.options.length = 0;

        bacSi.append(new Option("Choose your doctor", ""));
        $.getJSON("/api/ajax?date=" + ngayKham + "&shift=" + shift).done(function (task) {
            console.log("DONE: ", JSON.stringify(task));
            let ds = task;
            for (let i = 0; i < ds.length; i++) {
                console.log(ds[i].id);
                bacSi.append(new Option(ds[i].ten, ds[i].id));
            }
        });
    }

    function getJson1(caKham, ngayKham) {
        caKham.append(new Option("Choose your shift", ""));
        $.getJSON("/api/ajax1?date=" + ngayKham).done(function (task) {
            console.log("DONE: ", JSON.stringify(task));
            let ds = task;
            for (let i = 0; i < ds.length; i++) {
                console.log(ds[i].id);
                caKham.append(new Option(ds[i].tenCa, ds[i].id));
            }
        });

        if (caKham.options.length > 0) {
            getJson();
        }
    }

    function reExamination() {
        $('form:nth-child(2)').fadeOut();
        $('form:nth-child(1).lead').fadeIn();
    }

    function appointment() {
        $('form:nth-child(2)').fadeIn();
        $('form:nth-child(1).lead').fadeOut();
    }

    //
    // function checkDate(obj) {
    //     if (obj.value == "" || !moment(obj.value, "DD/MM/YYYY").isValid())
    //     {
    //         let caKham = document.querySelector("select[name=caKham]");
    //
    //         caKham.disabled = true;
    //     }
    // }


</script>
