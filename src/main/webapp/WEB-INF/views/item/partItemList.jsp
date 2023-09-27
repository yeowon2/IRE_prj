<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<jsp:include page="../nav.jsp"></jsp:include>
<body>
 <!-- Page Banner Start -->
    <div id="page-banner-area" class="page-banner">
      <div class="page-banner-title">
        <div class="text-center">
          <h2>My Properties</h2>
          <a href="#"><i class="lni-home"></i> Home</a>
          <span class="crumbs-spacer"><i class="lni-chevron-right"></i></span>
          <span class="current">매물 보기</span>
        </div>
      </div>
    </div>
    <!-- Page Banner End -->

    <!-- Ueser Section Start -->
    <section class="user-page section-padding">
	    <div class="container">
        <div class="row">
          <div class="col-lg-12 col-md-7 col-xs-12">
            <div class="my-properties">
              <table class="table-responsive">
                <thead>
                  <tr>
                    <th>매물번호</th>
                    <th>Property</th>
                    <th></th>
                    <th>Date Added</th>
                    <th>Views</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                  	<td></td>
                    <td class="image">
                      <a href="property.html"><img alt="my-properties-3" src="/resources/assets/img/property/house-1.jpg" class="img-fluid"></a>
                    </td>
                    <td>
                      <div class="inner">
                        <a href="property.html"><h2>Modern Family Home</h2></a>
                        <figure><i class="lni-map-marker"></i> York Blvd, Los Angeles, US</figure>
                        <div class="tag price">$ 27,000</div>
                      </div>
                    </td>
                    <td>14.02.2018</td>
                    <td>421</td>
                    <td class="actions">
                      <a href="#" class="edit"><i class="lni-pencil"></i>Edit</a>
                      <a href="#"><i class="delete lni-trash"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td class="image">
                      <a href="property.html"><img alt="my-properties" src="/resources/assets/img/property/house-2.jpg"></a>
                    </td>
                    <td>
                      <div class="inner">
                        <a href="property.html"><h2>Beautiful Single Home</h2></a>
                        <figure><i class="lni-map-marker"></i> York Blvd, Los Angeles, US</figure>
                        <div class="tag price">$ 315,000</div>
                      </div>
                    </td>
                    <td>4.01.2018</td>
                    <td>266</td>
                    <td class="actions">
                      <a href="#" class="edit"><i class="lni-pencil"></i>Edit</a>
                      <a href="#"><i class="delete lni-trash"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td class="image">
                      <a href="property.html"><img alt="my-properties-2" src="/resources/assets/img/property/house-3.jpg"></a>
                    </td>
                    <td>
                      <div class="inner">
                        <a href="property.html"><h2>Masons Villas</h2></a>
                        <figure><i class="lni-map-marker"></i> York Blvd, Los Angeles, US</figure>
                        <div class="tag price">$ 62,000</div>
                      </div>
                    </td>
                    <td>24.03.2018</td>
                    <td>45</td>
                    <td class="actions">
                      <a href="#" class="edit"><i class="lni-pencil"></i>Edit</a>
                      <a href="#"><i class="delete lni-trash"></i></a>
                    </td>
                   </tr>
                  <tr>
                    <td class="image">
                        <a href="property.html"><img alt="my-properties-3" src="assets/img/property/house-4.jpg"></a>
                    </td>
                    <td>
                      <div class="inner">
                        <a href="property.html"><h2>Modern Family Home</h2></a>
                        <figure><i class="lni-map-marker"></i> York Blvd, Los Angeles, US</figure>
                        <div class="tag price">$ 27,000</div>
                      </div>
                    </td>
                    <td>14.02.2018</td>
                    <td>421</td>
                    <td class="actions">
                      <a href="#" class="edit"><i class="lni-pencil"></i>Edit</a>
                      <a href="#"><i class="delete lni-trash"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td class="image">
                      <a href="property.html"><img alt="my-properties" src="/resources/assets/img/property/house-5.jpg"></a>
                    </td>
                    <td>
                      <div class="inner">
                        <a href="property.html"><h2>Beautiful Single Home</h2></a>
                        <figure><i class="lni-map-marker"></i> York Blvd, Los Angeles, US</figure>
                        <div class="tag price">$ 315,000</div>
                      </div>
                    </td>
                    <td>4.01.2018</td>
                    <td>266</td>
                    <td class="actions">
                      <a href="#" class="edit"><i class="lni-pencil"></i>Edit</a>
                      <a href="#"><i class="delete lni-trash"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td class="image">
                      <a href="property.html"><img alt="my-properties-2" src="/resources/assets/img/property/house-2.jpg"></a>
                    </td>
                    <td>
                      <div class="inner">
                        <a href="property.html"><h2>Masons Villas</h2></a>
                        <figure><i class="lni-map-marker"></i> York Blvd, Los Angeles, US</figure>
                        <div class="tag price">$ 62,000</div>
                      </div>
                    </td>
                    <td>24.03.2018</td>
                    <td>45</td>
                    <td class="actions">
                      <a href="#" class="edit"><i class="lni-pencil"></i>Edit</a>
                      <a href="#"><i class="delete lni-trash"></i></a>
                    </td>
                  </tr>
                </tbody>
              </table>
              <div class="pagination-container">
                <nav>
                  <ul class="pagination">
                    <li class="page-item"><a class="btn btn-common" href="#"><i class="lni-chevron-left"></i> Previous </a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="btn btn-common" href="#">Next <i class="lni-chevron-right"></i></a></li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
	      </div>
	    </div>
	  </section>
    <!-- Ueser Section End -->
<%-- <jsp:include page="../footer.jsp"></jsp:include> --%>
<jsp:include page="../js.jsp"></jsp:include>
  </body>
</html>