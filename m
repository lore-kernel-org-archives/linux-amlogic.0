Return-Path: <SRS0=y5YC=UX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D64C43613
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 12:38:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39EE8212F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 12:38:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZHl8j3Q/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39EE8212F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ppXhgbo0G57DJwb697Zz3e23lLmlxOhdSOENOzLfJ0=; b=ZHl8j3Q/UtJNn8
	xBn4Lbs95eccDqCjXNI6uT7J8xfHJbK3xbFyhsAdhvdUasqPd1OqJBKs9tB50HrChX1JLMrzxKAfU
	ztFF/3ZrTRxgaNLGpkGzAsKpz2yAtUGyULoMzlaphbR6xI1v653LUsHmVoGkt8GQQ1OSNHQhqGqws
	JVquj/68j3Whqa9KSGicOElLd2MNerJD5IggPjLt9OKKEBOM6VOQcTsfx0NOiec2MabLDr5VS718b
	yuLFzn2DfP/aQiZcvynz6GVpB45tIy3bRTmXqFydK/c78ntWoYJrQsM+IVNzrEgjOqMHtuoRmHnMC
	KodOtB8RskwTIjjQc2Ig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfOEl-0007g4-Hb; Mon, 24 Jun 2019 12:38:19 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfOEh-0007f2-A0
 for linux-amlogic@lists.infradead.org; Mon, 24 Jun 2019 12:38:18 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jun 2019 05:37:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,412,1557212400"; d="scan'208";a="171974093"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 24 Jun 2019 05:37:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Jun 2019 15:37:41 +0300
Date: Mon, 24 Jun 2019 15:37:41 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] drm: Pretty print mode flags
Message-ID: <20190624123741.GJ5942@intel.com>
References: <20190620185049.8974-1-ville.syrjala@linux.intel.com>
 <20190620202542.GA12106@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620202542.GA12106@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_053815_427674_347DEB5C 
X-CRM114-Status: GOOD (  32.63  )
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-amlogic@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jun 20, 2019 at 10:25:42PM +0200, Sam Ravnborg wrote:
> Hi Ville.
> =

> On Thu, Jun 20, 2019 at 09:50:48PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Decode the mode flags when printing the modeline so that I
> > no longer have to decode the hex number myself.
> You are extending the current way to print mode flags,
> but I would anyway like to point out a different approach.
> =

> When I need to print a fourcc code it is as simple as:
> =

> {
> 	struct drm_format_name_buf fbuf;
> =

> 	printk("My format: %s\n", drm_get_format_name(format, &fbuf);
> }
> =

> This way to handle this feels more straightforward
> than the current approach used for modes.
> =

> Maybe bikeshedding, as your mileage may vary.

You're suggesting to print the whole mode to a temp buffer, and then
print that with just %s? I thought about that, but it would waste
even more stack so didn't think it was all that great.

> =

> A middle ground could be to introduce a struct for the buf so we know
> the callers do it right.

I'm not a fan of that struct approach because it forces you to use
a dedicated buffer for the thing. With just a raw char[] you can
print to anything, so it could be used more like strcat() as well.
Also I think it makes it more clear how much stack space you're
blowing away. And it looks a bit like snprintf() so it's more
clear what's happening on. Although in this case that last point
is kinda lost due to the macro thing.

> =

> Most of the code would be the same, but all call sites would need to be
> updated.
> What do you think?
> =

> 	Sam
> =

> =

> > =

> > To do this neatly I made the caller provide a temporary
> > on stack buffer where we can produce the results. I choce 64
> > bytes as a reasonable size for this. The worst case I think
> > is > 100 bytes but that kind of mode would be nonsense anyway
> > so I figured correct decoding isn't as important in such
> > cases.
> > =

> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > Cc: Vincent Abriou <vincent.abriou@st.com>
> > Cc: linux-amlogic@lists.infradead.org
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
> > Cc: Ilia Mirkin <imirkin@alum.mit.edu>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/armada/armada_crtc.c          |   3 +-
> >  drivers/gpu/drm/drm_atomic.c                  |   3 +-
> >  drivers/gpu/drm/drm_modes.c                   | 116 +++++++++++++++++-
> >  drivers/gpu/drm/i915/i915_debugfs.c           |   3 +-
> >  drivers/gpu/drm/meson/meson_dw_hdmi.c         |   3 +-
> >  drivers/gpu/drm/meson/meson_venc.c            |   4 +-
> >  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |   3 +-
> >  .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |   3 +-
> >  .../gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c  |   3 +-
> >  .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |   3 +-
> >  .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  |   4 +-
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |   3 +-
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  |   3 +-
> >  drivers/gpu/drm/msm/dsi/dsi_manager.c         |   3 +-
> >  drivers/gpu/drm/msm/edp/edp_bridge.c          |   3 +-
> >  drivers/gpu/drm/omapdrm/omap_connector.c      |   5 +-
> >  drivers/gpu/drm/omapdrm/omap_crtc.c           |   3 +-
> >  drivers/gpu/drm/panel/panel-ronbo-rb070d30.c  |   3 +-
> >  drivers/gpu/drm/sti/sti_crtc.c                |   3 +-
> >  include/drm/drm_modes.h                       |  14 ++-
> >  20 files changed, 165 insertions(+), 23 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/arm=
ada/armada_crtc.c
> > index ba4a3fab7745..ce9335682bd2 100644
> > --- a/drivers/gpu/drm/armada/armada_crtc.c
> > +++ b/drivers/gpu/drm/armada/armada_crtc.c
> > @@ -262,6 +262,7 @@ static void armada_drm_crtc_mode_set_nofb(struct dr=
m_crtc *crtc)
> >  	unsigned long flags;
> >  	unsigned i;
> >  	bool interlaced =3D !!(adj->flags & DRM_MODE_FLAG_INTERLACE);
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  =

> >  	i =3D 0;
> >  	rm =3D adj->crtc_hsync_start - adj->crtc_hdisplay;
> > @@ -270,7 +271,7 @@ static void armada_drm_crtc_mode_set_nofb(struct dr=
m_crtc *crtc)
> >  	tm =3D adj->crtc_vtotal - adj->crtc_vsync_end;
> >  =

> >  	DRM_DEBUG_KMS("[CRTC:%d:%s] mode " DRM_MODE_FMT "\n",
> > -		      crtc->base.id, crtc->name, DRM_MODE_ARG(adj));
> > +		      crtc->base.id, crtc->name, DRM_MODE_ARG(adj, buf));
> >  	DRM_DEBUG_KMS("lm %d rm %d tm %d bm %d\n", lm, rm, tm, bm);
> >  =

> >  	/* Now compute the divider for real */
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index 419381abbdd1..81caf91fbd72 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -380,6 +380,7 @@ static void drm_atomic_crtc_print_state(struct drm_=
printer *p,
> >  		const struct drm_crtc_state *state)
> >  {
> >  	struct drm_crtc *crtc =3D state->crtc;
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  =

> >  	drm_printf(p, "crtc[%u]: %s\n", crtc->base.id, crtc->name);
> >  	drm_printf(p, "\tenable=3D%d\n", state->enable);
> > @@ -393,7 +394,7 @@ static void drm_atomic_crtc_print_state(struct drm_=
printer *p,
> >  	drm_printf(p, "\tplane_mask=3D%x\n", state->plane_mask);
> >  	drm_printf(p, "\tconnector_mask=3D%x\n", state->connector_mask);
> >  	drm_printf(p, "\tencoder_mask=3D%x\n", state->encoder_mask);
> > -	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode=
));
> > +	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode=
, buf));
> >  =

> >  	if (crtc->funcs->atomic_print_state)
> >  		crtc->funcs->atomic_print_state(p, state);
> > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> > index 57e6408288c8..3d15c600295a 100644
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -45,6 +45,118 @@
> >  =

> >  #include "drm_crtc_internal.h"
> >  =

> > +static char *snprint_cont(char *buf, int *len,
> > +			  const char *str, bool last)
> > +{
> > +	int r;
> > +
> > +	r =3D snprintf(buf, *len, "%s%s", str, last ? "" : ",");
> > +	if (r >=3D *len)
> > +		return buf;
> > +
> > +	*len -=3D r;
> > +	buf +=3D r;
> > +
> > +	return buf;
> > +}
> > +
> > +#define MODE_STR(x) { .name =3D #x, .flag =3D DRM_MODE_FLAG_ ## x, }
> > +
> > +static const struct {
> > +	const char *name;
> > +	u32 flag;
> > +} mode_flags[] =3D {
> > +	MODE_STR(PHSYNC),
> > +	MODE_STR(NHSYNC),
> > +	MODE_STR(PVSYNC),
> > +	MODE_STR(NVSYNC),
> > +	MODE_STR(INTERLACE),
> > +	MODE_STR(CSYNC),
> > +	MODE_STR(PCSYNC),
> > +	MODE_STR(NCSYNC),
> > +	MODE_STR(DBLSCAN),
> > +	MODE_STR(HSKEW),
> > +	MODE_STR(DBLCLK),
> > +	MODE_STR(CLKDIV2),
> > +};
> > +
> > +#undef MODE_STR
> > +#define MODE_STR(x) [DRM_MODE_FLAG_3D_ ## x >> 14] =3D #x
> > +
> > +static const char * const stereo_flags[] =3D {
> > +	MODE_STR(NONE),
> > +	MODE_STR(FRAME_PACKING),
> > +	MODE_STR(FIELD_ALTERNATIVE),
> > +	MODE_STR(LINE_ALTERNATIVE),
> > +	MODE_STR(SIDE_BY_SIDE_FULL),
> > +	MODE_STR(L_DEPTH),
> > +	MODE_STR(L_DEPTH_GFX_GFX_DEPTH),
> > +	MODE_STR(TOP_AND_BOTTOM),
> > +	MODE_STR(SIDE_BY_SIDE_HALF),
> > +};
> > +
> > +#undef MODE_STR
> > +#define MODE_STR(x) [DRM_MODE_FLAG_PIC_AR_ ## x >> 19] =3D #x
> > +
> > +static const char * const aspect_flags[] =3D {
> > +	MODE_STR(NONE),
> > +	MODE_STR(4_3),
> > +	MODE_STR(16_9),
> > +	MODE_STR(64_27),
> > +	MODE_STR(256_135),
> > +};
> > +
> > +#undef MODE_STR
> > +
> > +const char *drm_get_mode_flags_name(char *buf, int len, u32 flags)
> > +{
> > +	char *ptr =3D buf;
> > +	int i;
> > +
> > +	if (len =3D=3D 0)
> > +		return buf;
> > +
> > +	buf[0] =3D '\0';
> > +
> > +	if (flags & DRM_MODE_FLAG_3D_MASK) {
> > +		int stereo =3D (flags & DRM_MODE_FLAG_3D_MASK) >> 14;
> > +
> > +		if (stereo < ARRAY_SIZE(stereo_flags)) {
> > +			flags &=3D ~DRM_MODE_FLAG_3D_MASK;
> > +			ptr =3D snprint_cont(ptr, &len,
> > +					   stereo_flags[stereo], !flags);
> > +		}
> > +	}
> > +
> > +	if (flags & DRM_MODE_FLAG_PIC_AR_MASK) {
> > +		int aspect =3D (flags & DRM_MODE_FLAG_PIC_AR_MASK) >> 19;
> > +
> > +		if (aspect < ARRAY_SIZE(aspect_flags)) {
> > +			flags &=3D ~DRM_MODE_FLAG_PIC_AR_MASK;
> > +			ptr =3D snprint_cont(ptr, &len,
> > +					   aspect_flags[aspect], !flags);
> > +		}
> > +	}
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mode_flags); i++) {
> > +		u32 flag =3D mode_flags[i].flag;
> > +
> > +		if ((flags & flag) =3D=3D 0)
> > +			continue;
> > +
> > +		flags &=3D ~flag;
> > +
> > +		ptr =3D snprint_cont(ptr, &len,
> > +				   mode_flags[i].name, !flags);
> > +	}
> > +
> > +	if (flags)
> > +		ptr =3D snprint_cont(ptr, &len, "?", true);
> > +
> > +	return buf;
> > +}
> > +EXPORT_SYMBOL(drm_get_mode_flags_name);
> > +
> >  /**
> >   * drm_mode_debug_printmodeline - print a mode to dmesg
> >   * @mode: mode to print
> > @@ -53,7 +165,9 @@
> >   */
> >  void drm_mode_debug_printmodeline(const struct drm_display_mode *mode)
> >  {
> > -	DRM_DEBUG_KMS("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> > +
> > +	DRM_DEBUG_KMS("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode, buf));
> >  }
> >  EXPORT_SYMBOL(drm_mode_debug_printmodeline);
> >  =

> > diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915=
/i915_debugfs.c
> > index 62cf34db9280..18a3ff8e1461 100644
> > --- a/drivers/gpu/drm/i915/i915_debugfs.c
> > +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> > @@ -2539,12 +2539,13 @@ static int i915_dmc_info(struct seq_file *m, vo=
id *unused)
> >  static void intel_seq_print_mode(struct seq_file *m, int tabs,
> >  				 struct drm_display_mode *mode)
> >  {
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  	int i;
> >  =

> >  	for (i =3D 0; i < tabs; i++)
> >  		seq_putc(m, '\t');
> >  =

> > -	seq_printf(m, DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
> > +	seq_printf(m, DRM_MODE_FMT "\n", DRM_MODE_ARG(mode, buf));
> >  }
> >  =

> >  static void intel_encoder_info(struct seq_file *m,
> > diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/me=
son/meson_dw_hdmi.c
> > index df3f9ddd2234..30e53a043ba6 100644
> > --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> > +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> > @@ -610,13 +610,14 @@ dw_hdmi_mode_valid(struct drm_connector *connecto=
r,
> >  		   const struct drm_display_mode *mode)
> >  {
> >  	struct meson_drm *priv =3D connector->dev->dev_private;
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  	unsigned int vclk_freq;
> >  	unsigned int venc_freq;
> >  	unsigned int hdmi_freq;
> >  	int vic =3D drm_match_cea_mode(mode);
> >  	enum drm_mode_status status;
> >  =

> > -	DRM_DEBUG_DRIVER("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
> > +	DRM_DEBUG_DRIVER("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode, bu=
f));
> >  =

> >  	/* If sink max TMDS clock, we reject the mode */
> >  	if (connector->display_info.max_tmds_clock &&
> > diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson=
/meson_venc.c
> > index 7b7a0d8d737c..09acbc06f9f3 100644
> > --- a/drivers/gpu/drm/meson/meson_venc.c
> > +++ b/drivers/gpu/drm/meson/meson_venc.c
> > @@ -987,9 +987,11 @@ void meson_venc_hdmi_mode_set(struct meson_drm *pr=
iv, int vic,
> >  	if (meson_venc_hdmi_supported_vic(vic)) {
> >  		vmode =3D meson_venc_hdmi_get_vic_vmode(vic);
> >  		if (!vmode) {
> > +			char buf[DRM_MODE_FLAGS_BUF_LEN];
> > +
> >  			dev_err(priv->dev, "%s: Fatal Error, unsupported mode "
> >  				DRM_MODE_FMT "\n", __func__,
> > -				DRM_MODE_ARG(mode));
> > +				DRM_MODE_ARG(mode, buf));
> >  			return;
> >  		}
> >  	} else {
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/dr=
m/msm/disp/mdp4/mdp4_crtc.c
> > index 0cfd4c06b610..f68d9f74b0e4 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> > @@ -238,6 +238,7 @@ static void mdp4_crtc_mode_set_nofb(struct drm_crtc=
 *crtc)
> >  	enum mdp4_dma dma =3D mdp4_crtc->dma;
> >  	int ovlp =3D mdp4_crtc->ovlp;
> >  	struct drm_display_mode *mode;
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  =

> >  	if (WARN_ON(!crtc->state))
> >  		return;
> > @@ -245,7 +246,7 @@ static void mdp4_crtc_mode_set_nofb(struct drm_crtc=
 *crtc)
> >  	mode =3D &crtc->state->adjusted_mode;
> >  =

> >  	DBG("%s: set mode: " DRM_MODE_FMT,
> > -			mdp4_crtc->name, DRM_MODE_ARG(mode));
> > +	    mdp4_crtc->name, DRM_MODE_ARG(mode, buf));
> >  =

> >  	mdp4_write(mdp4_kms, REG_MDP4_DMA_SRC_SIZE(dma),
> >  			MDP4_DMA_SRC_SIZE_WIDTH(mode->hdisplay) |
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c b/drivers=
/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
> > index caa39b4621e3..2e0dca4d2484 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
> > @@ -55,10 +55,11 @@ static void mdp4_dsi_encoder_mode_set(struct drm_en=
coder *encoder,
> >  	uint32_t dsi_hsync_skew, vsync_period, vsync_len, ctrl_pol;
> >  	uint32_t display_v_start, display_v_end;
> >  	uint32_t hsync_start_x, hsync_end_x;
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  =

> >  	mode =3D adjusted_mode;
> >  =

> > -	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> > +	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode, buf));
> >  =

> >  	ctrl_pol =3D 0;
> >  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c b/drivers=
/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
> > index 259d51971401..e88ac070a672 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
> > @@ -101,10 +101,11 @@ static void mdp4_dtv_encoder_mode_set(struct drm_=
encoder *encoder,
> >  	uint32_t dtv_hsync_skew, vsync_period, vsync_len, ctrl_pol;
> >  	uint32_t display_v_start, display_v_end;
> >  	uint32_t hsync_start_x, hsync_end_x;
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  =

> >  	mode =3D adjusted_mode;
> >  =

> > -	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> > +	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode, buf));
> >  =

> >  	mdp4_dtv_encoder->pixclock =3D mode->clock * 1000;
> >  =

> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/driver=
s/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> > index df6f9803a1d7..99bdae9c945b 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> > @@ -270,10 +270,11 @@ static void mdp4_lcdc_encoder_mode_set(struct drm=
_encoder *encoder,
> >  	uint32_t lcdc_hsync_skew, vsync_period, vsync_len, ctrl_pol;
> >  	uint32_t display_v_start, display_v_end;
> >  	uint32_t hsync_start_x, hsync_end_x;
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  =

> >  	mode =3D adjusted_mode;
> >  =

> > -	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> > +	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode, buf));
> >  =

> >  	mdp4_lcdc_encoder->pixclock =3D mode->clock * 1000;
> >  =

> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c b/drivers=
/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> > index eeef41fcd4e1..6bffbebee8bb 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> > @@ -124,9 +124,11 @@ void mdp5_cmd_encoder_mode_set(struct drm_encoder =
*encoder,
> >  			       struct drm_display_mode *mode,
> >  			       struct drm_display_mode *adjusted_mode)
> >  {
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> > +
> >  	mode =3D adjusted_mode;
> >  =

> > -	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> > +	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode, buf));
> >  	pingpong_tearcheck_setup(encoder, mode);
> >  	mdp5_crtc_set_pipeline(encoder->crtc);
> >  }
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/dr=
m/msm/disp/mdp5/mdp5_crtc.c
> > index c3751c95b452..888a25d1da8b 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > @@ -378,13 +378,14 @@ static void mdp5_crtc_mode_set_nofb(struct drm_cr=
tc *crtc)
> >  	u32 mixer_width, val;
> >  	unsigned long flags;
> >  	struct drm_display_mode *mode;
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  =

> >  	if (WARN_ON(!crtc->state))
> >  		return;
> >  =

> >  	mode =3D &crtc->state->adjusted_mode;
> >  =

> > -	DBG("%s: set mode: " DRM_MODE_FMT, crtc->name, DRM_MODE_ARG(mode));
> > +	DBG("%s: set mode: " DRM_MODE_FMT, crtc->name, DRM_MODE_ARG(mode, buf=
));
> >  =

> >  	mixer_width =3D mode->hdisplay;
> >  	if (r_mixer)
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu=
/drm/msm/disp/mdp5/mdp5_encoder.c
> > index 820a62c40063..809118bb6965 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
> > @@ -115,10 +115,11 @@ static void mdp5_vid_encoder_mode_set(struct drm_=
encoder *encoder,
> >  	uint32_t hsync_start_x, hsync_end_x;
> >  	uint32_t format =3D 0x2100;
> >  	unsigned long flags;
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  =

> >  	mode =3D adjusted_mode;
> >  =

> > -	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> > +	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode, buf));
> >  =

> >  	ctrl_pol =3D 0;
> >  =

> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/ms=
m/dsi/dsi_manager.c
> > index ec6cb0f7f206..1bf2f503b84b 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -527,8 +527,9 @@ static void dsi_mgr_bridge_mode_set(struct drm_brid=
ge *bridge,
> >  	struct msm_dsi *other_dsi =3D dsi_mgr_get_other_dsi(id);
> >  	struct mipi_dsi_host *host =3D msm_dsi->host;
> >  	bool is_dual_dsi =3D IS_DUAL_DSI();
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  =

> > -	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> > +	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode, buf));
> >  =

> >  	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
> >  		return;
> > diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/msm=
/edp/edp_bridge.c
> > index 2950bba4aca9..0844345862ef 100644
> > --- a/drivers/gpu/drm/msm/edp/edp_bridge.c
> > +++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
> > @@ -51,8 +51,9 @@ static void edp_bridge_mode_set(struct drm_bridge *br=
idge,
> >  	struct drm_connector *connector;
> >  	struct edp_bridge *edp_bridge =3D to_edp_bridge(bridge);
> >  	struct msm_edp *edp =3D edp_bridge->edp;
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  =

> > -	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> > +	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode, buf));
> >  =

> >  	list_for_each_entry(connector, &dev->mode_config.connector_list, head=
) {
> >  		if ((connector->encoder !=3D NULL) &&
> > diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm=
/omapdrm/omap_connector.c
> > index 5967283934e1..4ce29288c70e 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_connector.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_connector.c
> > @@ -276,6 +276,7 @@ static enum drm_mode_status omap_connector_mode_val=
id(struct drm_connector *conn
> >  	struct omap_connector *omap_connector =3D to_omap_connector(connector=
);
> >  	struct drm_display_mode new_mode =3D { { 0 } };
> >  	enum drm_mode_status status;
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  =

> >  	status =3D omap_connector_mode_fixup(omap_connector->output, mode,
> >  					   &new_mode);
> > @@ -288,8 +289,8 @@ static enum drm_mode_status omap_connector_mode_val=
id(struct drm_connector *conn
> >  =

> >  done:
> >  	DBG("connector: mode %s: " DRM_MODE_FMT,
> > -			(status =3D=3D MODE_OK) ? "valid" : "invalid",
> > -			DRM_MODE_ARG(mode));
> > +	    (status =3D=3D MODE_OK) ? "valid" : "invalid",
> > +	    DRM_MODE_ARG(mode, buf));
> >  =

> >  	return status;
> >  }
> > diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omap=
drm/omap_crtc.c
> > index d61215494617..221459d6abe9 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> > @@ -553,9 +553,10 @@ static void omap_crtc_mode_set_nofb(struct drm_crt=
c *crtc)
> >  {
> >  	struct omap_crtc *omap_crtc =3D to_omap_crtc(crtc);
> >  	struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  =

> >  	DBG("%s: set mode: " DRM_MODE_FMT,
> > -	    omap_crtc->name, DRM_MODE_ARG(mode));
> > +	    omap_crtc->name, DRM_MODE_ARG(mode, buf));
> >  =

> >  	drm_display_mode_to_videomode(mode, &omap_crtc->vm);
> >  }
> > diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu=
/drm/panel/panel-ronbo-rb070d30.c
> > index 3c15764f0c03..468ebdca94f4 100644
> > --- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> > +++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> > @@ -126,12 +126,13 @@ static int rb070d30_panel_get_modes(struct drm_pa=
nel *panel)
> >  	struct rb070d30_panel *ctx =3D panel_to_rb070d30_panel(panel);
> >  	struct drm_display_mode *mode;
> >  	static const u32 bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  =

> >  	mode =3D drm_mode_duplicate(panel->drm, &default_mode);
> >  	if (!mode) {
> >  		DRM_DEV_ERROR(&ctx->dsi->dev,
> >  			      "Failed to add mode " DRM_MODE_FMT "\n",
> > -			      DRM_MODE_ARG(&default_mode));
> > +			      DRM_MODE_ARG(&default_mode, buf));
> >  		return -EINVAL;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_c=
rtc.c
> > index dc64fbfc4e61..bc9602f519d7 100644
> > --- a/drivers/gpu/drm/sti/sti_crtc.c
> > +++ b/drivers/gpu/drm/sti/sti_crtc.c
> > @@ -54,11 +54,12 @@ sti_crtc_mode_set(struct drm_crtc *crtc, struct drm=
_display_mode *mode)
> >  	struct sti_compositor *compo =3D dev_get_drvdata(dev);
> >  	struct clk *compo_clk, *pix_clk;
> >  	int rate =3D mode->clock * 1000;
> > +	char buf[DRM_MODE_FLAGS_BUF_LEN];
> >  =

> >  	DRM_DEBUG_KMS("CRTC:%d (%s) mode: (%s)\n",
> >  		      crtc->base.id, sti_mixer_to_str(mixer), mode->name);
> >  =

> > -	DRM_DEBUG_KMS(DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
> > +	DRM_DEBUG_KMS(DRM_MODE_FMT "\n", DRM_MODE_ARG(mode, buf));
> >  =

> >  	if (mixer->id =3D=3D STI_MIXER_MAIN) {
> >  		compo_clk =3D compo->clk_compo_main;
> > diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> > index 083f16747369..3962dbf82100 100644
> > --- a/include/drm/drm_modes.h
> > +++ b/include/drm/drm_modes.h
> > @@ -428,20 +428,27 @@ struct drm_display_mode {
> >  	struct list_head export_head;
> >  };
> >  =

> > +/**
> > + * DRM_MODE_FLAGS_BUF_LEN - reasonable size for the buffer passed to D=
RM_MODE_ARG()
> > + */
> > +#define DRM_MODE_FLAGS_BUF_LEN 64
> > +
> >  /**
> >   * DRM_MODE_FMT - printf string for &struct drm_display_mode
> >   */
> > -#define DRM_MODE_FMT    "\"%s\": %d %d %d %d %d %d %d %d %d %d 0x%x 0x=
%x"
> > +#define DRM_MODE_FMT    "\"%s\": %d %d %d %d %d %d %d %d %d %d 0x%x 0x=
%x %s"
> >  =

> >  /**
> >   * DRM_MODE_ARG - printf arguments for &struct drm_display_mode
> >   * @m: display mode
> > + * @b: buffer for temporary string
> >   */
> > -#define DRM_MODE_ARG(m) \
> > +#define DRM_MODE_ARG(m, b) \
> >  	(m)->name, (m)->vrefresh, (m)->clock, \
> >  	(m)->hdisplay, (m)->hsync_start, (m)->hsync_end, (m)->htotal, \
> >  	(m)->vdisplay, (m)->vsync_start, (m)->vsync_end, (m)->vtotal, \
> > -	(m)->type, (m)->flags
> > +	(m)->type, (m)->flags, \
> > +	drm_get_mode_flags_name(b, sizeof(b), (m)->flags)
> >  =

> >  #define obj_to_mode(x) container_of(x, struct drm_display_mode, base)
> >  =

> > @@ -542,5 +549,6 @@ drm_mode_parse_command_line_for_connector(const cha=
r *mode_option,
> >  struct drm_display_mode *
> >  drm_mode_create_from_cmdline_mode(struct drm_device *dev,
> >  				  struct drm_cmdline_mode *cmd);
> > +const char *drm_get_mode_flags_name(char *buf, int len, u32 flags);
> >  =

> >  #endif /* __DRM_MODES_H__ */
> > -- =

> > 2.21.0

-- =

Ville Syrj=E4l=E4
Intel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
