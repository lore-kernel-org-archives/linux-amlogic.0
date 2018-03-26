From: robh@kernel.org (Rob Herring)
Date: Mon, 26 Mar 2018 17:25:02 -0500
Subject: [PATCHv2 1/3] dt-bindings: display: dw_hdmi.txt: add cec-disable
 property
In-Reply-To: <20180323125915.13986-2-hverkuil@xs4all.nl>
References: <20180323125915.13986-1-hverkuil@xs4all.nl>
 <20180323125915.13986-2-hverkuil@xs4all.nl>
Message-ID: <20180326072830.iphtbw5mkeciv4kj@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, Mar 23, 2018 at 01:59:13PM +0100, Hans Verkuil wrote:
> From: Hans Verkuil <hans.verkuil@cisco.com>
> 
> Some boards have both a DesignWare and their own CEC controller.
> The CEC pin is only hooked up to their own CEC controller and not
> to the DW controller.
> 
> Add the cec-disable property to disable the DW CEC controller.
> 
> This particular situation happens on Amlogic boards that have their
> own meson CEC controller.

Seems like we could avoid this by describing how the CEC line is hooked 
up which could be needed for other reasons.

> 
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt | 3 +++
>  1 file changed, 3 insertions(+)
