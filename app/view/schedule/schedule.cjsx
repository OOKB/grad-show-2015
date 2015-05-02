React = require 'react'

module.exports = React.createClass
  # getInitialState: ->

  render: ->
    <article id="schedule">
      <div className="container">
        <h2>Schedule of Events</h2>
        <div>
          {### group 1 ###}
          <div className="scheduleGroup first">
            <h3>Ongoing throughout the Spring</h3>
            <ul>
              <li>Curatorial Practice, MFA</li>
            </ul>
          </div>
          <div className="scheduleGroup">
            <h3>January 23–February 8<br />
              February 13–March 1<br />
              March 6–March 22 <br /></h3>
            <ul>
              <li>Teaching, MA: Show I <br /><em className="opening">Opening Reception: Friday, January 23, 5-7PM</em><br />
                Teaching, MA: Show II <br /><em className="opening">Opening Reception: Friday, February 13, 5-7PM</em><br />
                Teaching, MA: Show III <br /><em className="opening">Opening Reception: Friday, March 6, 5-7PM</em></li>
            </ul>
          </div>
          {### group 2 ###}
          <div className="scheduleGroup">
            <h3>March 27–April 12</h3>
            <p className="opening">Opening Reception: Friday, March 27, 5-7PM</p>
            <ul>
              <li>Graphic Design, MFA</li>
              <li>Illustration Practice, MFA</li>
              <li>Post Baccalaureate Certificate in Fine Art</li>
              <li>Post Baccalaureate Certificate in Graphic Design</li>
            </ul>
          </div>
          {### group 3 ###}
          <div className="scheduleGroup">
            <h3>April 17–May 3</h3>
            <p className="opening">Opening Reception: Friday, April 17, 5-7PM</p>
            <ul>
              <li>Community Arts, MFA</li>
              <li>LeRoy E. Hoffberger School of Painting, MFA</li>
              <li>Mount Royal School of Art, MFA</li>
              <li>Photographic and Electronic Media, MFA</li>
              <li>Rinehart School of Sculpture, MFA</li>
            </ul>
          </div>
          <div className="scheduleGroup">
            <h3><del>May 1</del> TBD</h3>
            <ul>
              <li>Social Design, MA <br />
                  <em>Social Design Exchange: Perspectives from the Class of 2015</em> <br />
                  BBOX at the Gateway, <br />
                  Maryland Institute College of Art <br/>
                  <time dateTime="2015-05-01T18:00-20:30">6pm–8:30pm</time>.
              </li>
            </ul>
          </div>
          <div className="scheduleGroup">
            <h3><del>May 2</del> May 16</h3>
            <ul>
              <li>Critical Studies, MA <br />
                  <em>Narratives of Modernity, Contemporaneity, and Desire</em> <br />
                  Symposium at the Walters Art Museum <br/>
                  <time dateTime="2015-05-02T10:00-17:00">10am–5pm</time>.
              </li>
            </ul>
          </div>
          <div className="scheduleGroup">
            <h3>June 27–July 11</h3>
            <p className="opening">Closing Reception: Friday, July 10, 5-7PM</p>
            <ul>
              <li>Studio Art, MFA</li>
            </ul>
          </div>
          <div className="scheduleGroup last">
            <h3>July 26–31</h3>
            <p className="opening">Opening Reception: Friday, July 31, 6-7:30pm</p>
            <ul>
              <li>Art Education, MA</li>
            </ul>
          </div>
        </div>
      </div>
    </article>
