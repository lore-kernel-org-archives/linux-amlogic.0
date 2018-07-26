From: jbrunet@baylibre.com (jbrunet at baylibre.com)
Date: Thu, 26 Jul 2018 09:40:02 +0200
Subject: [PATCH 14/15] ASoC: meson: add axg sound card DT binding
 documentation
In-Reply-To: <20180725190619.GA20234@rob-hp-laptop>
References: <20180717153643.8806-1-jbrunet@baylibre.com>
 <20180717153643.8806-18-jbrunet@baylibre.com>
 <20180725190619.GA20234@rob-hp-laptop>
Message-ID: <9a71a5644b5257d48436a4d28972d4142a96b0eb.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, 2018-07-25 at 13:06 -0600, Rob Herring wrote:
> > +- amlogic,aux-devs : List of phandles pointing to auxiliary devices
> > +- amlogic,widgets : Please refer to widgets.txt.
> > +- amlogic,routing : A list of the connections between audio components.
> 
> audio-routing IIRC

Wouldn't it make sense to do the same for widgets and aux-devs then ?

audio-widgets ?
audio-aux-devs ?
