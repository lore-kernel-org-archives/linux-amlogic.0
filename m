From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 25 May 2018 09:56:07 +0200
Subject: armbian amlogic mainline kernel(4.17.0-rc6) on odroid-c2 borad
In-Reply-To: <CAHPeh9kkMM8etOTZvBRgJ08Pq5-EWEH5rsxgOZqAmU1ZYp8ufQ@mail.gmail.com>
References: <CAHPeh9kkMM8etOTZvBRgJ08Pq5-EWEH5rsxgOZqAmU1ZYp8ufQ@mail.gmail.com>
Message-ID: <3d951d3c-132c-d407-a533-1afa572cb76b@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

On 25/05/2018 01:20, Michal Lazo wrote:
> Hello
> I added support for mainline kernel to armbian for odroid-c2 board
> Linux version 4.17.0-rc6-odroidc2
> uboot 2018.03
> And I found some errors?
> https://pastebin.com/c3k82Xei

I saw this aswell, it was not present on 4.17-rc1, I will need to bisect what causes this.

> 
> Are there any known patches for them ?
> I hoped that most of HDMI stuff should be ok since 4.16

It should, but the DRM framework evolves.

Can you Cc the linux-amlogic ML for bug reports please ?

Thanks,
Neil

> 
> Best regards
> Michal Lazo
