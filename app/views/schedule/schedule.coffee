React = require 'react'
{article, h2, h3, ul, li, div} = require 'reactionary'

data = require '../../data/schedule.json'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    article
      id: 'schedule',
        div
          className: 'container',
            h2 'Schedule of Events'
            div
              dangerouslySetInnerHTML:
                __html: '<!-- group 1 -->
                <div class="scheduleGroup first">
                  <h3>January 23&ndash;February 8<br />
                    February 12&ndash;March 1<br />
                    March 6&ndash;March 22</h3>
                  <ul>
                    <li>Teaching, MA: Show I<br />
                      Teaching, MA: Show II<br />
                      Teaching, MA: Show III</li>
                  </ul>
                </div>

                <!-- group 2 -->
                <div class="scheduleGroup">
                  <h3>March 27&ndash;April 12 <span class="meta"><a href="#">After Party Info</a></span></h3>
                  <ul>
                    <li>Illustration Practice, MFA</li>
                    <li>Graphic Design, MFA</li>
                    <li>Post Baccalaureate Certificate in Graphic Design</li>
                    <li>Post Baccalaureate Certificate in Fine Art</li>
                  </ul>
                </div>

                <!-- group 3 -->
                <div class="scheduleGroup">
                  <h3>April 17&ndash;May 3 <span class="meta"><a href="#">After Party Info</a></span></h3>
                  <ul>
                    <li>Rinehart School of Sculpture</li>
                    <li>Mount Royal School of Art</li>
                    <li>Leroy E. Hoffberger School of Painting</li>
                    <li>Photographic and Electronic Media, MFA</li>
                    <li>Community Arts, MFA</li>
                  </ul>
                </div>

                <!-- group 4 -->
                <div class="scheduleGroup">
                  <h3>TBD</h3>
                  <ul>
                    <li>Social Design, MA</li>
                  </ul>
                </div>

                <!-- group 5 -->
                <div class="scheduleGroup">
                  <h3>May 2</h3>
                  <ul>
                    <li>Critical Studies, MA, Symposium @ Walters</li>
                  </ul>
                </div>

                <!-- group 6 -->
                <div class="scheduleGroup">
                  <h3>June 20&ndash;July 27</h3>
                  <ul>
                    <li>Studio Art, MFA</li>
                  </ul>
                </div>

                <!-- group 7 -->
                <div class="scheduleGroup last">
                  <h3>July 26&ndash;31 <span class="meta">Ongoing, throughout the city</span></h3>
                  <ul>
                    <li>Art Education, MA</li>
                  </ul>
                </div>'

