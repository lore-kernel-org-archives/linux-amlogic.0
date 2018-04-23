From: yixun.lan@amlogic.com (Yixun Lan)
Date: Mon, 23 Apr 2018 15:21:22 +0800
Subject: dt-bindings: Invalid SPDX License Identifier
In-Reply-To: <alpine.DEB.2.21.1804222108120.6136@nanos.tec.linutronix.de>
References: <alpine.DEB.2.21.1804222108120.6136@nanos.tec.linutronix.de>
Message-ID: <795a50ff-d627-bcd5-950f-71e98016707e@amlogic.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Thomas

On 04/23/18 03:14, Thomas Gleixner wrote:
> Yixun,
> 
> commit c16292578ffa437c77e17d5d3da20330a10b8a86
> Author: Yixun Lan <yixun.lan@amlogic.com>
> Date:   Fri Nov 10 16:46:49 2017 +0800
> 
>     dt-bindings: reset: Add bindings for the Meson-AXG SoC Reset Controller
>     
>     Add DT bindings for the Meson-AXG SoC Reset Controller include file,
>     and also slightly update documentation.
>     
>     Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
>     Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>     Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Added the following SPDX-License-Identifier: (GPL-2.0+ OR BSD) in the
> middle of the top of file comment.
> 
> There are two problems with that:
> 
> 1) BSD is not a valid SPDX identifier. See https://spdx.org/licenses/
> 
>    You need to say which BSD variant you mean.
> 
> 2) Please put the License identifier to the place which is defined in
>    Documentation/process/licenses.rst, i.e. the first line of the dts file
>    and not to some random place.
> 

thanks for pointing this out

I will adjust the license to "GPL-2.0+ OR BSD-3-Clause" since this file
was copied from include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
and it's a good idea to preserve the old license.

Yixun
