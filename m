From: robh@kernel.org (Rob Herring)
Date: Thu, 26 Jul 2018 07:20:18 -0600
Subject: [PATCH 14/15] ASoC: meson: add axg sound card DT binding
 documentation
In-Reply-To: <9a71a5644b5257d48436a4d28972d4142a96b0eb.camel@baylibre.com>
References: <20180717153643.8806-1-jbrunet@baylibre.com>
 <20180717153643.8806-18-jbrunet@baylibre.com>
 <20180725190619.GA20234@rob-hp-laptop>
 <9a71a5644b5257d48436a4d28972d4142a96b0eb.camel@baylibre.com>
Message-ID: <CAL_Jsq+PCMbK_Ky6N-f-U65Lr9irSVCMNdvgfu3RJTRg_G90Qg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jul 26, 2018 at 1:40 AM <jbrunet@baylibre.com> wrote:
>
> On Wed, 2018-07-25 at 13:06 -0600, Rob Herring wrote:
> > > +- amlogic,aux-devs : List of phandles pointing to auxiliary devices
> > > +- amlogic,widgets : Please refer to widgets.txt.
> > > +- amlogic,routing : A list of the connections between audio components.
> >
> > audio-routing IIRC
>
> Wouldn't it make sense to do the same for widgets and aux-devs then ?
>
> audio-widgets ?
> audio-aux-devs ?

Probably so. Those aren't as common.

Rob
