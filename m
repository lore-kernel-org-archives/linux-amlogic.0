Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBA2C61DB6
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Aug 2026 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQhZnOtCIXEDu5VBmRRoc4Qutu7WrMCKczLjoIGPzTE=; b=h95M7mEWkP89Wa
	fsvbbaBrxl7unMFTJMTjRnT8fv0oP9ZVvrPjKKab94I69lot1sMRM2ilJBNd7GVMECSnuzeweH2cY
	xQxyLobeKB5KcnE7GFga/Mrme0xYaiRsipPD1R90LIrZ8ePGlOrqof4lHaDsYpPfBEE7IvRIk80DW
	ypjwd06BIvIxEE/9uJETg4ah09E+hxBqgTkx0U9NSGDBy4WD7nXGdPo30oH3sIdt8QWnm8czZUTmt
	brJCUQn3n3VAuNewXF37wgCV2qvFNAMg2AJqoAA7/iVuBfV/pMz75NYQgH4pDa5gmdHCMIfbIlJhB
	qgoWDgOLbwmgFAtMGvNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymCY-00000000LEn-04sV;
	Tue, 25 Aug 2026 08:08:10 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymCT-00000000LED-1DoL;
	Tue, 25 Aug 2026 08:08:08 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9810086CDC;
	Tue, 25 Aug 2026 08:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787645278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MDJ3jw29gkr7CXJOmn+O4FQkSRmuVB8deXVafri3TZo=;
	b=IQAgRM8BPMUn5sHFI1grgs4nJQTd6F3Rx2whrXFyjtSvTBSo4RNud4zSbNMWjrjUCtHbTH
	HzbGP8BFF3Hqzpp/O5ayOaQU8p14eAK94kvzygmYEhRWEFfrN38BsloEdCH5oNnY2mW0Kf
	mEJMeCcfT8xtnvPLDLUC0H9f3NFXdcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787645278;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MDJ3jw29gkr7CXJOmn+O4FQkSRmuVB8deXVafri3TZo=;
	b=lz48kjJy+seOuVlUp+acwQRZVTZ2iA60K+m54O/ej3Ln/0b2/ql0P1JR5aCCbGu5HPLw3p
	FDCglF2avAag9RCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787645274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MDJ3jw29gkr7CXJOmn+O4FQkSRmuVB8deXVafri3TZo=;
	b=NaOJKmg8/6Jtc9UrizZTFae3bZZvxq7jJdGL+hrZgri9FuewUeGvVBWhJNPGTdIHplWTbv
	MiHphBABFps99GP3HDGC6Q1QiutfEqTD16qr4ngJ5g4s9kbMd8a7ChwUHkUddYWVnSOXbW
	z2buJYwztzuZszI10ZCXL/AHk3WOQ4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787645274;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MDJ3jw29gkr7CXJOmn+O4FQkSRmuVB8deXVafri3TZo=;
	b=qF8jGasF5tDU5HpAPDHta87N+gATgr1VtRSt4MiBP2zDZ3Oc5cPfp6DxD6W70pdnom0/6e
	RBON95eh7BsISVCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4FBF713332;
	Tue, 25 Aug 2026 08:07:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id svAVEllNjWrMeAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 25 Aug 2026 08:07:53 +0000
Message-ID: <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
Date: Tue, 25 Aug 2026 10:07:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] drm/drm_simple: remove drm_simple_encoder_init
To: Diogo Silva <diogompaissilva@gmail.com>, Jingoo Han
 <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-doc@vger.kernel.org
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com,samsung.com,ffwll.ch,kernel.org,linaro.org,ideasonboard.com,linux.intel.com,amd.com,nvidia.com,agner.ch,nxp.com,intel.com,redhat.com,collabora.com,chromium.org,iki.fi,pengutronix.de,glider.be,google.com,arm.com,baylibre.com,googlemail.com,lwn.net,linuxfoundation.org];
	TAGGED_RCPT(0.00)[renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL6e75e7xiqh135443e1d3zo16)];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_010805_633514_B793947E 
X-CRM114-Status: GOOD (  19.45  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkKCkFtIDIwLjA3LjI2IHVtIDE3OjQwIHNjaHJpZWIgRGlvZ28gU2lsdmE6Cj4gVGhlIHNpbXBs
ZSBLTVMgaGVscGVycyBhcmUgZGVwcmVjYXRlZCBiZWNhdXNlIHRoZXkgb25seSBhZGQgYW4KPiBp
bnRlcm1lZGlhdGUgbGF5ZXIgYmV0d2VlbiBkcml2ZXJzIGFuZCBhdG9taWMgbW9kZXNldHRpbmcu
Cj4KPiBUaGlzIHNlcmllcyBvcGVuLWNvZGVzIGFsbCByZW1haW5pbmcgZHJtX3NpbXBsZV9lbmNv
ZGVyX2luaXQoKSB1c2VycyBieQo+IGNhbGxpbmcgZHJtX2VuY29kZXJfaW5pdCgpIGRpcmVjdGx5
IGFuZCBwcm92aWRpbmcgZHJpdmVyLWxvY2FsCj4gZHJtX2VuY29kZXJfZnVuY3Mgd2hlcmUgbmVl
ZGVkLiBBZnRlciB0aGUgZHJpdmVyIGNvbnZlcnNpb25zLCB0aGUgaGVscGVyCj4gaXMgcmVtb3Zl
ZCBhbmQgdGhlIGNvbXBsZXRlZCBEUk0gdG9kbyBpdGVtIGlzIGRyb3BwZWQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBEaW9nbyBTaWx2YSA8ZGlvZ29tcGFpc3NpbHZhQGdtYWlsLmNvbT4KCkZvciB0aGUg
d2hvbGUgc2VyaWVzOgoKUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPgoKRGlvZ28sIGRvIHlvdSB3YW50IHRvIHNlbmQgb3V0IGFub3RoZXIgcmV2aXNp
b24/IE90aGVyd2lzZSBpdCdzIHRpbWUgdG8gCmdldCB0aGVzZSBwYXRjaGVzIG1lcmdlZC4KCkJl
c3QgcmVnYXJkcwpUaG9tYXMKCgoKPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0gQ2hhbmdlIGxv
Z2dpbmcgdG8gY29uc2lzdGVudGx5IHVzZSBkcm1fZXJyKCkKPiAtIExpbmsgdG8gdjE6IGh0dHBz
Oi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDcxOS1kcm1fc2ltcGxlX2VuY29kZXJfaW5pdC12MS0w
LWE3OGM1MDllMzA2MkBnbWFpbC5jb20KPgo+IFRvOiBKaW5nb28gSGFuIDxqaW5nb29oYW4xQGdt
YWlsLmNvbT4KPiBUbzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgo+IFRvOiBTZXVu
Zy1Xb28gS2ltIDxzdzAzMTIua2ltQHNhbXN1bmcuY29tPgo+IFRvOiBLeXVuZ21pbiBQYXJrIDxr
eXVuZ21pbi5wYXJrQHNhbXN1bmcuY29tPgo+IFRvOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPgo+IFRvOiBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+Cj4gVG86IEtyenlz
enRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiBUbzogUGV0ZXIgR3JpZmZpbiA8cGV0
ZXIuZ3JpZmZpbkBsaW5hcm8ub3JnPgo+IFRvOiBBbGltIEFraHRhciA8YWxpbS5ha2h0YXJAc2Ft
c3VuZy5jb20+Cj4gVG86IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4KPiBUbzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQGlkZWFzb25i
b2FyZC5jb20+Cj4gVG86IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51
eC5pbnRlbC5jb20+Cj4gVG86IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiBU
bzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gVG86IE1pY2hhbCBT
aW1layA8bWljaGFsLnNpbWVrQGFtZC5jb20+Cj4gVG86IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5
LnJlZGluZ0BrZXJuZWwub3JnPgo+IFRvOiBNaWtrbyBQZXJ0dHVuZW4gPG1wZXJ0dHVuZW5AbnZp
ZGlhLmNvbT4KPiBUbzogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KPiBU
bzogU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+Cj4gVG86IEFsaXNvbiBXYW5nIDxhbGlz
b24ud2FuZ0BueHAuY29tPgo+IFRvOiBBbml0aGEgQ2hyaXNhbnRodXMgPGFuaXRoYS5jaHJpc2Fu
dGh1c0BpbnRlbC5jb20+Cj4gVG86IERhdmlkIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
IFRvOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiBUbzogRG1pdHJ5IE9zaXBl
bmtvIDxkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4KPiBUbzogR3VyY2hldGFuIFNpbmdo
IDxndXJjaGV0YW5zaW5naEBjaHJvbWl1bS5vcmc+Cj4gVG86IENoaWEtSSBXdSA8b2x2YWZmZUBn
bWFpbC5jb20+Cj4gVG86IEp5cmkgU2FyaGEgPGp5cmkuc2FyaGFAaWtpLmZpPgo+IFRvOiBMaXUg
WWluZyA8dmljdG9yLmxpdUBueHAuY29tPgo+IFRvOiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNv
bT4KPiBUbzogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+IFRvOiBQZW5n
dXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPgo+IFRvOiBGYWJpbyBF
c3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cj4gVG86IENodW4tS3VhbmcgSHUgPGNodW5rdWFu
Zy5odUBrZXJuZWwub3JnPgo+IFRvOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPgo+IFRvOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+IFRv
OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bj
b2xsYWJvcmEuY29tPgo+IFRvOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPgo+IFRvOiBYaW5saWFuZyBMaXUgPHhpbmxpYW5nLmxpdUBsaW5hcm8ub3JnPgo+IFRv
OiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IFRvOiBZb25ncWluIExp
dSA8eW9uZ3Fpbi5saXVAbGluYXJvLm9yZz4KPiBUbzogSm9obiBTdHVsdHogPGpzdHVsdHpAZ29v
Z2xlLmNvbT4KPiBUbzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+Cj4gVG86IE5l
aWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+IFRvOiBLZXZpbiBIaWxt
YW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgo+IFRvOiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJh
eWxpYnJlLmNvbT4KPiBUbzogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5n
bEBnb29nbGVtYWlsLmNvbT4KPiBUbzogSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD4K
PiBUbzogU2h1YWggS2hhbiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz4KPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3JnCj4gQ2M6
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtdGVncmFAdmdlci5rZXJu
ZWwub3JnCj4gQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LmRldgo+IENjOiBpbXhAbGlz
dHMubGludXguZGV2Cj4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBD
YzogbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnCj4KPiAt
LS0KPiBEaW9nbyBTaWx2YSAoMTUpOgo+ICAgICAgICBkcm0vZXh5bm9zOiByZW1vdmUgZGVwZW5k
ZW5jeSBvbiBEUk0gc2ltcGxlIGhlbHBlcnMKPiAgICAgICAgZHJtL3hsbngvenlucW1wX2Rwc3Vi
OiByZW1vdmUgZGVwZW5kZW5jeSBvbiBEUk0gc2ltcGxlIGhlbHBlcnMKPiAgICAgICAgZHJtL3Rl
Z3JhOiByZW1vdmUgZGVwZW5kZW5jeSBvbiBEUk0gc2ltcGxlIGhlbHBlcnMKPiAgICAgICAgZHJt
L2ZzbC1kY3U6IHJlbW92ZSBkZXBlbmRlbmN5IG9uIERSTSBzaW1wbGUgaGVscGVycwo+ICAgICAg
ICBkcm0va21iOiByZW1vdmUgZGVwZW5kZW5jeSBvbiBEUk0gc2ltcGxlIGhlbHBlcnMKPiAgICAg
ICAgZHJtL3ZpcnRpbzogcmVtb3ZlIGRlcGVuZGVuY3kgb24gRFJNIHNpbXBsZSBoZWxwZXJzCj4g
ICAgICAgIGRybS90aWRzczogcmVtb3ZlIGRlcGVuZGVuY3kgb24gRFJNIHNpbXBsZSBoZWxwZXJz
Cj4gICAgICAgIGRybS9pbXg6IHJlbW92ZSBkZXBlbmRlbmN5IG9uIERSTSBzaW1wbGUgaGVscGVy
cwo+ICAgICAgICBkcm0vbWVkaWF0ZWs6IHJlbW92ZSBkZXBlbmRlbmN5IG9uIERSTSBzaW1wbGUg
aGVscGVycwo+ICAgICAgICBkcm0vcmVuZXNhcy9zaG1vYmlsZTogcmVtb3ZlIGRlcGVuZGVuY3kg
b24gRFJNIHNpbXBsZSBoZWxwZXJzCj4gICAgICAgIGRybS9oaXNpbGljb24va2lyaW46IHJlbW92
ZSBkZXBlbmRlbmN5IG9uIERSTSBzaW1wbGUgaGVscGVycwo+ICAgICAgICBkcm0vYXJtL2tvbWVk
YTogcmVtb3ZlIGRlcGVuZGVuY3kgb24gRFJNIHNpbXBsZSBoZWxwZXJzCj4gICAgICAgIGRybS9t
ZXNvbjogcmVtb3ZlIGRlcGVuZGVuY3kgb24gRFJNIHNpbXBsZSBoZWxwZXJzCj4gICAgICAgIGRy
bS9kcm1fc2ltcGxlOiByZW1vdmUgZGVwcmVjYXRlZCBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdCBm
dW5jdGlvbgo+ICAgICAgICBEb2N1bWVudGF0aW9uL2dwdTogcmVtb3ZlIGNvbXBsZXRlZCBkcm1f
c2ltcGxlX2VuY29kZXJfaW5pdCgpIHRvZG8KPgo+ICAgRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5y
c3QgICAgICAgICAgICAgICAgICAgICAgICB8IDE1IC0tLS0tLS0tLS0tLS0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jICB8ICA5ICsrKysrKyst
LQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5jICAgICAgICAgICB8
IDEzICsrLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwLmMg
ICAgICAgICAgICAgICAgfCAxMyArKysrKysrKysrKy0tCj4gICBkcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZHBpLmMgICAgICAgICAgIHwgMTMgKysrKysrKysrKystLQo+ICAgZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jICAgICAgICAgICB8IDExICsrKysr
KysrKy0tCj4gICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fdmlkaS5jICAgICAg
ICAgIHwgMTMgKysrKysrKysrKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3Nf
aGRtaS5jICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKy0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vZnNsLWRjdS9mc2xfZGN1X2RybV9yZ2IuYyAgICAgICAgIHwgMTAgKysrKysrKy0tLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9kd19kcm1fZHNpLmMgICAgICB8ICA5ICsr
KysrKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL2lteC9kYy9kYy1rbXMuYyAgICAgICAgICAgICAg
ICAgICB8ICA4ICsrKysrKy0tCj4gICBkcml2ZXJzL2dwdS9kcm0va21iL2ttYl9kc2kuYyAgICAg
ICAgICAgICAgICAgICAgIHwgIDkgKysrKysrKy0tCj4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jICAgICAgICAgICAgICAgIHwgMTAgKysrKysrKy0tLQo+ICAgZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfY3Zicy5jICAgICAgICB8IDExICsrKysrKysrLS0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9kc2kuYyAgICAgICAgIHwg
MTEgKysrKysrKystLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2hk
bWkuYyAgICAgICAgfCAxMSArKysrKysrKy0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMv
c2htb2JpbGUvc2htb2JfZHJtX2NydGMuYyB8IDEwICsrKysrKystLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS90ZWdyYS9kc2kuYyAgICAgICAgICAgICAgICAgICAgICAgfCAxNiArKysrKysrKysrKysr
LS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvcmdiLmMgICAgICAgICAgICAgICAgICAgICAg
IHwgMTUgKysrKysrKysrKysrKy0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdGlkc3MvdGlkc3NfZW5j
b2Rlci5jICAgICAgICAgICAgIHwgMTAgKysrKysrKy0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X2Rpc3BsYXkuYyAgICAgICAgICB8IDEyICsrKysrKysrKystLQo+ICAgZHJp
dmVycy9ncHUvZHJtL3hsbngvenlucW1wX2ttcy5jICAgICAgICAgICAgICAgICB8IDE0ICsrKysr
KysrKysrKy0tCj4gICBpbmNsdWRlL2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaCAgICAgICAg
ICAgICAgIHwgIDQgLS0tLQo+ICAgMjMgZmlsZXMgY2hhbmdlZCwgMTgzIGluc2VydGlvbnMoKyks
IDc4IGRlbGV0aW9ucygtKQo+IC0tLQo+IGJhc2UtY29tbWl0OiBlMTExM2MzN2JhNGYxNjZlMzdk
ZWM3NGE3MjllNmRmZDhjYmExNjg3Cj4gY2hhbmdlLWlkOiAyMDI2MDcxOC1kcm1fc2ltcGxlX2Vu
Y29kZXJfaW5pdC1kMDY5YTRjYzdmOGIKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IERpb2dvIFNp
bHZhIDxkaW9nb21wYWlzc2lsdmFAZ21haWwuY29tPgo+CgotLSAKLS0KVGhvbWFzIFppbW1lcm1h
bm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgKRnJhbmtlbnN0ci4gMTQ2LCA5MDQ2MSBOw7xybmJlcmcsIEdlcm1hbnksIHd3dy5z
dXNlLmNvbQpHRjogSm9jaGVuIEphc2VyLCBBbmRyZXcgTWNEb25hbGQsIChIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
