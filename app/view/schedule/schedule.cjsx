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
            <h3>January–June</h3>
            <ul>
              <li>Curatorial Practice, MFA</li>
            </ul>
          </div>
          <div className="scheduleGroup">
            <h3>January 23–February 8<br />
              February 13–March 1<br />
              March 6–March 22</h3>
            <ul>
              <li>Teaching, MA: Show I<br />
                Teaching, MA: Show II<br />
                Teaching, MA: Show III</li>
            </ul>
          </div>
          {### group 2 ###}
          <div className="scheduleGroup">
            <h3>March 27–April 12</h3>
            <ul>
              <li>Illustration Practice, MFA</li>
              <li>Graphic Design, MFA</li>
              <li>Post Baccalaureate Certificate in Graphic Design</li>
              <li>Post Baccalaureate Certificate in Fine Art</li>
            </ul>
          </div>
          {### group 3 ###}
          <div className="scheduleGroup">
            <h3>April 17–May 3</h3>
            <ul>
              <li>Community Arts, MFA</li>
              <li>LeRoy E. Hoffberger School of Painting, MFA</li>
              <li>Mount Royal School of Art, MFA</li>
              <li>Photographic and Electronic Media, MFA</li>
              <li>Rinehart School of Sculpture, MFA</li>
            </ul>
          </div>
          <div className="scheduleGroup">
            <h3>May 1</h3>
            <ul>
              <li>Social Design, MA <br />
                  MASD Thesis Public Pitch <br />
                  BBOX at the Gateway, Maryland Institute College of Art
              </li>
            </ul>
          </div>
          <div className="scheduleGroup">
            <h3>May 2</h3>
            <ul>
              <li>Critical Studies, MA <br>
                  <em>Narratives of Modernity, Contemporaneity, and Desire </em><br>
                  Symposium at the Walters Art Museum
              </li>
            </ul>
          </div>
          <div className="scheduleGroup">
            <h3>June 27–July 11</h3>
            <ul>
              <li>Studio Art, MFA</li>
            </ul>
          </div>
          <div className="scheduleGroup last">
            <h3>July 26–31</h3>
            <ul>
              <li>Art Education, MA</li>
            </ul>
          </div>
        </div>
      </div>
    </article>
