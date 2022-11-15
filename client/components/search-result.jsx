import React from 'react';
import Dropdown from 'react-bootstrap/Dropdown';

export default class SearchResult extends React.Component {
  render() {
    const { result, filterType } = this.props;
    // eslint-disable-next-line array-callback-return
    const resultList = result.map((item, index) => {
      if (filterType === 'track') {
        return (
          <div key={index} className="row margin-neg">
            <div className="col-2 ps-0">
              <div className="img-album d-inline-block my-1">
                <img
                  src={item.cover}
                  className="rounded img-fluid"
                  alt={item.title} />
              </div>
            </div>
            <div className="col-9 pt-3">
              <span className="d-inline-block text-truncate" style={{ maxWidth: 250 }}>{item.title}</span>
              <br />
              <span className="text-muted">{item.name}</span>
            </div>
            <Dropdown className="col-1">
              <Dropdown.Toggle
                className="material-symbols-outlined dropdown-btn pt-4 ps-3"
                id="dropdown-basic" >
                more_horiz
              </Dropdown.Toggle>
              <Dropdown.Menu>
                <Dropdown.Item href="#/action-1">Add to Library</Dropdown.Item>
              </Dropdown.Menu>
            </Dropdown>
            <hr className="style1 w-100" />
          </div>
        );
      } else if (filterType === 'artist') {
        return (
          <div key={index} className="row margin-neg">
            <div className="col-2 ps-0">
              <div className="img-album d-inline-block my-1">
                <img
                  src={item.picture}
                  className="img-fluid img-artist"
                  alt={item.name} />
              </div>
            </div>
            <div className="col-10 pt-4">
              <span className="text-truncate">{item.name}</span>
            </div>
            <hr className="style1" />
          </div>
        );
      } else if (filterType === 'album') {
        return (
          <div key={index} className="row margin-neg">
            <div className="col-2 ps-0">
              <div className="img-album d-inline-block my-1">
                <img
                  src={item.cover}
                  className="rounded img-fluid"
                  alt={item.title} />
              </div>
            </div>
            <div className="col-10 pt-3">
              <span className="text-truncate">{item.title}</span>
              <br />
              <span className="text-muted">{item.name}</span>
            </div>
            <hr className="style1" />
          </div>
        );
      }
    });

    return (
      <div className="container">{resultList}</div>
    );
  }
}
