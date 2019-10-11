Return-Path: <SRS0=6gbJ=YE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F8BECE58C
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Oct 2019 07:46:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6B2B20679
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Oct 2019 07:46:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sNmYVgr/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="GQCcebgv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6B2B20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIN5SNpfnJrrhN8cIPvx8Gc9A8hxpGSPz7AohKV/reE=; b=sNmYVgr/GzW6vh
	S74J8tcNE3uiPn+ZQei1vqxFu19U/XK7K1ZI4yFnFJbty9XUrAtvq0GPC7B4/SmEE5PJBC8DaNAtY
	6OXBtAMmelgDmUBATZ77PqprC55+zj44pP3liIpFSzh75LBpvAC+stlns+lYgCZMNmGh8fwJlOTk4
	h1XyYeybtXPCcWplFjlwfbsGTeYYnG8Hi5l7KiUGT6/Srb6Gqj50+xzX6v9/miA/tvtmJqM+j3fEP
	I33RWPe4SJk1iB2rp/d8BCW4ZbLbqFDbok7tP7B0ZKQV60zoEghYXnRYkIYjkvg9JtlKgf+QUn48o
	H1dOnxiBav2XM16GM4oQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iIpcw-0006TE-JE; Fri, 11 Oct 2019 07:46:18 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIpct-0006SG-6w
 for linux-amlogic@lists.infradead.org; Fri, 11 Oct 2019 07:46:17 +0000
Received: by mail-ot1-x344.google.com with SMTP id y39so7183918ota.7
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Oct 2019 00:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VEdXx/unhoAspyNdeypuQARVF7GT/IGCOOxAclfE3Po=;
 b=GQCcebgv1Nezt0gLnYs64Uhq+XOoDiF9pgVupYddY2agJ0jwl1ZHPfH/WeCiyfgoXQ
 iq5NPP/1CWQiH97hdzTJ6vTvSyAg4tgU65ARu5hmxrJ7dEVZdFk7iGE/I2ue4EwaicLc
 GBbKD2yqe2mVK/XqieE25Uq0SnEhfspbsXaJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VEdXx/unhoAspyNdeypuQARVF7GT/IGCOOxAclfE3Po=;
 b=Oh8KKDLDPdTTsiBOQ9X7EU/adjFQOjvivB5RnrSyrJQRSao/XQwV58gdGe1bR6qcbB
 Cs7MMF1TS13z87lMW96EG8c1EUDzru32ekqr2utrr2C/0+/6QyS5BnnZdZlXWNXPq/qZ
 yjr/sI78CBryNLfnzIXT396x44R3fmP0QMwH68mgOuDizFKAFOptEjI7tcb08zBKWd+w
 L0zeRLkoewGrG23U8j1+1SrKGGVJ1g0epOzjhA1nDhyKhtITezKEwIilYyS9R0y1HOX3
 RcBQ56JrZnVNTh0E/sQnY4txkM6gSneeVRDmYcQ1tUrTNWcRbJdP7ZGU6+uuRjvb2vHI
 NrSQ==
X-Gm-Message-State: APjAAAVx3JHlCJSuDphO36Irznjvu6R0hrGMbpgrJWl2H8i0SNSbyoxw
 CKKRBcR1ZpBDYp13wjpgP8KUDBfyqlM0fMKPrwVkyA==
X-Google-Smtp-Source: APXvYqznhgLkah+3wRJ+x7D/C6vgv26plF47/dWiTEoYReVvMDPnUxM+auZwl5KrDTECXewJPmnw9etfbD3TKtVLmg0=
X-Received: by 2002:a9d:6b0a:: with SMTP id g10mr11180447otp.303.1570779973032; 
 Fri, 11 Oct 2019 00:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191010092526.10419-1-narmstrong@baylibre.com>
 <20191010092526.10419-5-narmstrong@baylibre.com>
 <20191010132601.GA10110@arm.com>
 <44f1771f-d640-f23d-995f-7bfcadd213bc@baylibre.com>
 <20191010173152.GA575@arm.com>
In-Reply-To: <20191010173152.GA575@arm.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 11 Oct 2019 09:46:01 +0200
Message-ID: <CAKMK7uE2p_VbJB5PfS1DJ5AzOm60p22c+YOJ18FtD4_ec61LwQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/meson: plane: add support for AFBC mode for OSD1
 plane
To: Ayan Halder <Ayan.Halder@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191011_004615_326593_0006C64C 
X-CRM114-Status: GOOD (  33.15  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Oct 10, 2019 at 7:32 PM Ayan Halder <Ayan.Halder@arm.com> wrote:
>
> On Thu, Oct 10, 2019 at 03:41:15PM +0200, Neil Armstrong wrote:
> > Hi Ayan,
> >
> > On 10/10/2019 15:26, Ayan Halder wrote:
> > > On Thu, Oct 10, 2019 at 11:25:23AM +0200, Neil Armstrong wrote:
> > >> This adds all the OSD configuration plumbing to support the AFBC decoders
> > >> path to display of the OSD1 plane.
> > >>
> > >> The Amlogic GXM and G12A AFBC decoders are integrated very differently.
> > >>
> > >> The Amlogic GXM has a direct output path to the OSD1 VIU pixel input,
> > >> because the GXM AFBC decoder seem to be a custom IP developed by Amlogic.
> > >>
> > >> On the other side, the Amlogic G12A AFBC decoder seems to be an external
> > >> IP that emit pixels on an AXI master hooked to a "Mali Unpack" block
> > >> feeding the OSD1 VIU pixel input.
> > >> This uses a weird "0x1000000" internal HW physical address on both
> > >> sides to transfer the pixels.
> > >>
> > >> For Amlogic GXM, the supported pixel formats are the same as the normal
> > >> linear OSD1 mode.
> > >>
> > >> On the other side, Amlogic added support for all AFBC v1.2 formats for
> > >> the G12A AFBC integration.
> > >>
> > >> For simplicity, we stick to the already supported formats for now.
> > >>
> > >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > >> ---
> > >>  drivers/gpu/drm/meson/meson_crtc.c  |   2 +
> > >>  drivers/gpu/drm/meson/meson_drv.h   |   4 +
> > >>  drivers/gpu/drm/meson/meson_plane.c | 215 ++++++++++++++++++++++++----
> > >>  3 files changed, 190 insertions(+), 31 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
> > >> index 57ae1c13d1e6..d478fa232951 100644
> > >> --- a/drivers/gpu/drm/meson/meson_crtc.c
> > >> +++ b/drivers/gpu/drm/meson/meson_crtc.c
> > >> @@ -281,6 +281,8 @@ void meson_crtc_irq(struct meson_drm *priv)
> > >>    if (priv->viu.osd1_enabled && priv->viu.osd1_commit) {
> > >>            writel_relaxed(priv->viu.osd1_ctrl_stat,
> > >>                            priv->io_base + _REG(VIU_OSD1_CTRL_STAT));
> > >> +          writel_relaxed(priv->viu.osd1_ctrl_stat2,
> > >> +                          priv->io_base + _REG(VIU_OSD1_CTRL_STAT2));
> > >>            writel_relaxed(priv->viu.osd1_blk0_cfg[0],
> > >>                            priv->io_base + _REG(VIU_OSD1_BLK0_CFG_W0));
> > >>            writel_relaxed(priv->viu.osd1_blk0_cfg[1],
> > >> diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
> > >> index 60f13c6f34e5..de25349be8aa 100644
> > >> --- a/drivers/gpu/drm/meson/meson_drv.h
> > >> +++ b/drivers/gpu/drm/meson/meson_drv.h
> > >> @@ -53,8 +53,12 @@ struct meson_drm {
> > >>            bool osd1_enabled;
> > >>            bool osd1_interlace;
> > >>            bool osd1_commit;
> > >> +          bool osd1_afbcd;
> > >>            uint32_t osd1_ctrl_stat;
> > >> +          uint32_t osd1_ctrl_stat2;
> > >>            uint32_t osd1_blk0_cfg[5];
> > >> +          uint32_t osd1_blk1_cfg4;
> > >> +          uint32_t osd1_blk2_cfg4;
> > >>            uint32_t osd1_addr;
> > >>            uint32_t osd1_stride;
> > >>            uint32_t osd1_height;
> > >> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> > >> index 5e798c276037..412941aa8402 100644
> > >> --- a/drivers/gpu/drm/meson/meson_plane.c
> > >> +++ b/drivers/gpu/drm/meson/meson_plane.c
> > >> @@ -23,6 +23,7 @@
> > >>  #include "meson_plane.h"
> > >>  #include "meson_registers.h"
> > >>  #include "meson_viu.h"
> > >> +#include "meson_osd_afbcd.h"
> > >>
> > >>  /* OSD_SCI_WH_M1 */
> > >>  #define SCI_WH_M1_W(w)                    FIELD_PREP(GENMASK(28, 16), w)
> > >> @@ -92,12 +93,38 @@ static int meson_plane_atomic_check(struct drm_plane *plane,
> > >>                                               false, true);
> > >>  }
> > >>
> > >> +#define MESON_MOD_AFBC_VALID_BITS (AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |     \
> > >> +                             AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |    \
> > >> +                             AFBC_FORMAT_MOD_YTR |                \
> > >> +                             AFBC_FORMAT_MOD_SPARSE |             \
> > >> +                             AFBC_FORMAT_MOD_SPLIT)
> > >> +
> > >>  /* Takes a fixed 16.16 number and converts it to integer. */
> > >>  static inline int64_t fixed16_to_int(int64_t value)
> > >>  {
> > >>    return value >> 16;
> > >>  }
> > >>
> > >> +static u32 meson_g12a_afbcd_line_stride(struct meson_drm *priv)
> > >> +{
> > >> +  u32 line_stride = 0;
> > >> +
> > >> +  switch (priv->afbcd.format) {
> > >> +  case DRM_FORMAT_RGB565:
> > >> +          line_stride = ((priv->viu.osd1_width << 4) + 127) >> 7;
> > >> +          break;
> > >> +  case DRM_FORMAT_RGB888:
> > >> +  case DRM_FORMAT_XRGB8888:
> > >> +  case DRM_FORMAT_ARGB8888:
> > >> +  case DRM_FORMAT_XBGR8888:
> > >> +  case DRM_FORMAT_ABGR8888:
> > > Please have a look at
> > > https://www.kernel.org/doc/html/latest/gpu/afbc.html for our
> > > recommendation. We suggest that *X* formats are avoided.
> > >
> > > Also, for interoperability and maximum compression efficiency (with
> > > AFBC_FORMAT_MOD_YTR), we suggest the following order :-
> > >
> > >         Component 0: R
> > >         Component 1: G
> > >         Component 2: B
> > >         Component 3: A (if available)
> >
> >
> > Sorry I don't understand, you ask me to limit AFBC to ABGR8888 ?
>
> Apologies for the confusion, as per the link, the formats which are
> suggested with AFBC_FORMAT_MOD_YTR are the BGR/ABGR formats (as
> listed in the 'AFBC formats' table)
>
> Thus, any other permutation of the components might make it incompatible
> with some other AFBC producers/consumers.

Uh, that's not how this is supposed to be used. Drivers are meant to
expose _everything_ they support (bonus if you roughly sort it in
preference order). Userspace then computes the intersection of
modifiers/formats supported by all devices it needs to share a buffer
with. Allowing that was the entire point of modifiers, if we
artificially limit to the common denominator we're back "only linear
works everywhere".
-Daniel

>
> >
> > But why if the HW (GPU and DPU) is capable of ?
> >
> > Isn't it an userspace choice ? I understand XRGB8888 is a waste
> > of memory space and compression efficiency, but this is not the
> > kernel driver's to decide this, right ?
> It is a reccomendation by the AFBC spec. As far as I understand, it
> depends upon the implementor of the AFBC spec(ie dpu, gpu, vpu, etc)
> to allow/disallow *X* formats for AFBC encoding/decoding.
>
> >
> > For interoperability I'll understand recommending a minimal set
> > of modifiers and formats. But here, each platform is also limited
> > by it's GPU capabilites aswell.
> Agreed
>
> >
> > Limiting to ABGR8888 would discard like every non-Android renderers,
> > using AFBC, I'm not sure it's the kernels driver's responsibility.
> I am not familiar with non-Android renderers.
> >
> > >
> > > Thus, DRM_FORMAT_ABGR, DRM_FORMAT_BGR should only be allowed.
> > >> +          line_stride = ((priv->viu.osd1_width << 5) + 127) >> 7;
> > >> +          break;
> > >> +  }
> > >> +
> > >> +  return ((line_stride + 1) >> 1) << 1;
> > >> +}
> > >> +
> > >>  static void meson_plane_atomic_update(struct drm_plane *plane,
> > >>                                  struct drm_plane_state *old_state)
> > >>  {
> >
> > [...]
> >
> > >>
> > >> +static bool meson_plane_format_mod_supported(struct drm_plane *plane,
> > >> +                                       u32 format, u64 modifier)
> > >> +{
> > >> +  struct meson_plane *meson_plane = to_meson_plane(plane);
> > >> +  struct meson_drm *priv = meson_plane->priv;
> > >> +  int i;
> > >> +
> > >> +  if (modifier == DRM_FORMAT_MOD_INVALID)
> > >> +          return false;
> > >> +
> > >> +  if (modifier == DRM_FORMAT_MOD_LINEAR)
> > >> +          return true;
> > >> +
> > >> +  if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) &&
> > >> +      !meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
> > >> +          return false;
> > >> +
> > >> +  if (modifier & ~DRM_FORMAT_MOD_ARM_AFBC(MESON_MOD_AFBC_VALID_BITS))
> > >> +          return false;
> > >> +
> > >> +  for (i = 0 ; i < plane->modifier_count ; ++i)
> > >> +          if (plane->modifiers[i] == modifier)
> > >> +                  break;
> > >> +
> > >> +  if (i == plane->modifier_count) {
> > >> +          DRM_DEBUG_KMS("Unsupported modifier\n");
> > >> +          return false;
> > >> +  }
> >
> > I can add a warn_once here, would it be enough ?
> >
> > >> +
> > >> +  if (priv->afbcd.ops && priv->afbcd.ops->supported_fmt)
> > >> +          return priv->afbcd.ops->supported_fmt(modifier, format);
> > >> +
> > >> +  DRM_DEBUG_KMS("AFBC Unsupported\n");
> > >> +  return false;
> > >> +}
> > >> +
> > >>  static const struct drm_plane_funcs meson_plane_funcs = {
> > >>    .update_plane           = drm_atomic_helper_update_plane,
> > >>    .disable_plane          = drm_atomic_helper_disable_plane,
> > >> @@ -353,6 +457,7 @@ static const struct drm_plane_funcs meson_plane_funcs = {
> > >>    .reset                  = drm_atomic_helper_plane_reset,
> > >>    .atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> > >>    .atomic_destroy_state   = drm_atomic_helper_plane_destroy_state,
> > >> +  .format_mod_supported   = meson_plane_format_mod_supported,
> > >>  };
> > >>
> > >>  static const uint32_t supported_drm_formats[] = {
> > >> @@ -364,10 +469,53 @@ static const uint32_t supported_drm_formats[] = {
> > >>    DRM_FORMAT_RGB565,
> > >>  };
> > >>
> > >> +static const uint64_t format_modifiers_afbc_gxm[] = {
> > >> +  DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |
> > >> +                          AFBC_FORMAT_MOD_SPARSE |
> > >> +                          AFBC_FORMAT_MOD_YTR),
> > >> +  /* SPLIT mandates SPARSE, RGB modes mandates YTR */
> > >> +  DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |
> > >> +                          AFBC_FORMAT_MOD_YTR |
> > >> +                          AFBC_FORMAT_MOD_SPARSE |
> > >> +                          AFBC_FORMAT_MOD_SPLIT),
> > >> +  DRM_FORMAT_MOD_LINEAR,
> > >> +  DRM_FORMAT_MOD_INVALID,
> > >> +};
> > >> +
> > >> +static const uint64_t format_modifiers_afbc_g12a[] = {
> > >> +  /*
> > >> +   * - TOFIX Support AFBC modifiers for YUV formats (16x16 + TILED)
> > >> +   * - AFBC_FORMAT_MOD_YTR is mandatory since we only support RGB
> > >> +   * - SPLIT is mandatory for performances reasons when in 16x16
> > >> +   *   block size
> > >> +   * - 32x8 block size + SPLIT is mandatory with 4K frame size
> > >> +   *   for performances reasons
> > >> +   */
> > >> +  DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |
> > >> +                          AFBC_FORMAT_MOD_YTR |
> > >> +                          AFBC_FORMAT_MOD_SPARSE |
> > >> +                          AFBC_FORMAT_MOD_SPLIT),
> > >> +  DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> > >> +                          AFBC_FORMAT_MOD_YTR |
> > >> +                          AFBC_FORMAT_MOD_SPARSE),
> > >> +  DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> > >> +                          AFBC_FORMAT_MOD_YTR |
> > >> +                          AFBC_FORMAT_MOD_SPARSE |
> > >> +                          AFBC_FORMAT_MOD_SPLIT),
> > >> +  DRM_FORMAT_MOD_LINEAR,
> > >> +  DRM_FORMAT_MOD_INVALID,
> > >> +};
> > >> +
> > >> +static const uint64_t format_modifiers_default[] = {
> > >> +  DRM_FORMAT_MOD_LINEAR,
> > >> +  DRM_FORMAT_MOD_INVALID,
> > >> +};
> > >> +
> > >>  int meson_plane_create(struct meson_drm *priv)
> > >>  {
> > >>    struct meson_plane *meson_plane;
> > >>    struct drm_plane *plane;
> > >> +  const uint64_t *format_modifiers = format_modifiers_default;
> > >>
> > >>    meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
> > >>                               GFP_KERNEL);
> > >> @@ -377,11 +525,16 @@ int meson_plane_create(struct meson_drm *priv)
> > >>    meson_plane->priv = priv;
> > >>    plane = &meson_plane->base;
> > >>
> > >> +  if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM))
> > >> +          format_modifiers = format_modifiers_afbc_gxm;
> > >> +  else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
> > >> +          format_modifiers = format_modifiers_afbc_g12a;
> > >> +
> > >>    drm_universal_plane_init(priv->drm, plane, 0xFF,
> > >>                             &meson_plane_funcs,
> > >>                             supported_drm_formats,
> > >>                             ARRAY_SIZE(supported_drm_formats),
> > >> -                           NULL,
> > >> +                           format_modifiers,
> > >>                             DRM_PLANE_TYPE_PRIMARY, "meson_primary_plane");
> > >>
> > >>    drm_plane_helper_add(plane, &meson_plane_helper_funcs);
> > >> --
> > >> 2.22.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
