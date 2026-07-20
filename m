Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A5AC4452C
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 11:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTKtW5WSm91oDLiIOPqcUCM4GFSBm8+zhQGYfoJFmCc=; b=j48ki6CvhfoBT2
	eJ94iQhwx6TtFpKS9P/31fopgSImvHu3tlgNy1Ayu5R3PGfbP4hA/VNuDfNmpfRmiIGNdrm3Se2H+
	wr8oc0ynUX+uS+7xX4gRsewrB7z1BEoZJfa8ngCfmzs1NBGkKVgDdTX7Bu9eazGzRB98VhgtfJaCJ
	Dy8P9lGTB1aqzuzO4IMj3tRVOgeaDsoK5ToQXX4qnyhgoe8sv3bPb9bhva9iIUx5jmdzwcdUT7NMA
	8xEtzKdlSf9KeQ8fWyNc3jMp0Zbkcp9XZXodq3Pc5t+xVjfRoAdxNNv3WYfoU7D9LimFiYhPINRQc
	seJKTQsvfGrwQ0ywTsPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlloA-00000006Z76-0ztE;
	Mon, 20 Jul 2026 11:05:14 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllo6-00000006Z5I-3At2
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 11:05:12 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 30D0A3E09;
	Mon, 20 Jul 2026 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784545507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jy7YQBE9HAIVBFE0VOkSBBzLYevZIQzBSEslKdqseyw=;
	b=y2FwkocI3YQIQJFXqrW9ZKICtrgU7bGVS3vz/2uDjZt14w7zVOXlNMnQ4XTNJUK34rzpem
	JLpUktCdpsjMGideeJkQRJwuSLFJDvapFsfvDgZzS0FCBSnObDwNE5QRv++UUjkN1mcj24
	5ZICafeK/+n3gCHZyy4tZSyWy5JZ2yo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784545507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jy7YQBE9HAIVBFE0VOkSBBzLYevZIQzBSEslKdqseyw=;
	b=SF9cBLWTd+GoNKIEYOgPttCZT+F5hmFW/zHjyXOkatbqIxXJH/pnUErjpIGt+RTdjV8E6n
	kYPGn/y9Fv7Ta9Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784545507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jy7YQBE9HAIVBFE0VOkSBBzLYevZIQzBSEslKdqseyw=;
	b=y2FwkocI3YQIQJFXqrW9ZKICtrgU7bGVS3vz/2uDjZt14w7zVOXlNMnQ4XTNJUK34rzpem
	JLpUktCdpsjMGideeJkQRJwuSLFJDvapFsfvDgZzS0FCBSnObDwNE5QRv++UUjkN1mcj24
	5ZICafeK/+n3gCHZyy4tZSyWy5JZ2yo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784545507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jy7YQBE9HAIVBFE0VOkSBBzLYevZIQzBSEslKdqseyw=;
	b=SF9cBLWTd+GoNKIEYOgPttCZT+F5hmFW/zHjyXOkatbqIxXJH/pnUErjpIGt+RTdjV8E6n
	kYPGn/y9Fv7Ta9Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BEE11779AA;
	Mon, 20 Jul 2026 11:05:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cqwbLeEAXmpUBAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 20 Jul 2026 11:05:05 +0000
Message-ID: <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
Date: Mon, 20 Jul 2026 13:05:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] drm/exynos: remove dependency on DRM simple helpers
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
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-1-a78c509e3062@gmail.com>
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
In-Reply-To: <20260719-drm_simple_encoder_init-v1-1-a78c509e3062@gmail.com>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.981];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_RCPT(0.00)[renesas];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,samsung.com,ffwll.ch,kernel.org,linaro.org,ideasonboard.com,linux.intel.com,amd.com,nvidia.com,agner.ch,nxp.com,intel.com,redhat.com,collabora.com,chromium.org,iki.fi,pengutronix.de,glider.be,google.com,arm.com,baylibre.com,googlemail.com,lwn.net,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL6e75e7xiqh135443e1d3zo16)];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_040511_093080_8D95C36C 
X-CRM114-Status: GOOD (  22.11  )
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

SGkKCkFtIDE5LjA3LjI2IHVtIDAxOjM1IHNjaHJpZWIgRGlvZ28gU2lsdmE6Cj4gVGhlIHNpbXBs
ZSBLTVMgaGVscGVycyBhcmUgZGVwcmVjYXRlZCBiZWNhdXNlIHRoZXkgb25seSBhZGQgYW4KPiBp
bnRlcm1lZGlhdGUgbGF5ZXIgYmV0d2VlbiBkcml2ZXJzIGFuZCBhdG9taWMgbW9kZXNldHRpbmcu
Cj4KPiBPcGVuLWNvZGUgZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoKSBieSBjYWxsaW5nIGRybV9l
bmNvZGVyX2luaXQoKQo+IGRpcmVjdGx5IGFuZCBwcm92aWRpbmcgZHJpdmVyLWxvY2FsIGRybV9l
bmNvZGVyX2Z1bmNzLgo+IEFsc28gY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBmcm9tIGRybV9lbmNv
ZGVyX2luaXQoKSB0byBhdm9pZCBzaWxlbnQKPiBmYWlsdXJlcy4KPgo+IFNpZ25lZC1vZmYtYnk6
IERpb2dvIFNpbHZhIDxkaW9nb21wYWlzc2lsdmFAZ21haWwuY29tPgo+IC0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHAuYyAgICAgICB8IDEzICsrKysrKysrKysrLS0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcGkuYyAgfCAxNCArKysrKysrKysr
KystLQo+ICAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jICB8IDExICsr
KysrKysrKy0tCj4gICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fdmlkaS5jIHwg
MTQgKysrKysrKysrKysrLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWku
YyAgICAgfCAxNSArKysrKysrKysrKysrLS0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwLmMK
PiBpbmRleCBiODA1NDAzMjgxNTAuLjE1OTg4OTJjNjAyYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHAuYwo+IEBAIC0yNCwxMSArMjQsMTEgQEAKPiAgICNpbmNsdWRlIDxkcm0vZHJt
X2JyaWRnZS5oPgo+ICAgI2luY2x1ZGUgPGRybS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5oPgo+ICAg
I2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9lbmNvZGVyLmg+
Cj4gICAjaW5jbHVkZSA8ZHJtL2RybV9vZi5oPgo+ICAgI2luY2x1ZGUgPGRybS9kcm1fcGFuZWwu
aD4KPiAgICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gICAjaW5jbHVkZSA8ZHJtL2RybV9w
cm9iZV9oZWxwZXIuaD4KPiAtI2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaD4K
PiAgICNpbmNsdWRlIDxkcm0vZXh5bm9zX2RybS5oPgo+ICAgCj4gICAjaW5jbHVkZSAiZXh5bm9z
X2RybV9jcnRjLmgiCj4gQEAgLTc5LDYgKzc5LDEwIEBAIHN0YXRpYyB2b2lkIGV4eW5vc19kcF9u
b3Aoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQo+ICAgCS8qIGRvIG5vdGhpbmcgKi8KPiAg
IH0KPiAgIAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2Z1bmNzIGV4eW5vc19k
cF9lbmNvZGVyX2Z1bmNzID0gewo+ICsJLmRlc3Ryb3kgPSBkcm1fZW5jb2Rlcl9jbGVhbnVwLAo+
ICt9Owo+ICsKPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNz
IGV4eW5vc19kcF9lbmNvZGVyX2hlbHBlcl9mdW5jcyA9IHsKPiAgIAkubW9kZV9zZXQgPSBleHlu
b3NfZHBfbW9kZV9zZXQsCj4gICAJLmVuYWJsZSA9IGV4eW5vc19kcF9ub3AsCj4gQEAgLTk1LDcg
Kzk5LDEyIEBAIHN0YXRpYyBpbnQgZXh5bm9zX2RwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCj4gICAKPiAgIAlkcC0+ZHJtX2RldiA9
IGRybV9kZXY7Cj4gICAKPiAtCWRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KGRybV9kZXYsIGVuY29k
ZXIsIERSTV9NT0RFX0VOQ09ERVJfVE1EUyk7Cj4gKwlyZXQgPSBkcm1fZW5jb2Rlcl9pbml0KGRy
bV9kZXYsIGVuY29kZXIsICZleHlub3NfZHBfZW5jb2Rlcl9mdW5jcywKPiArCQkJICAgICAgIERS
TV9NT0RFX0VOQ09ERVJfVE1EUywgTlVMTCk7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJZGV2X2Vycihk
cC0+ZGV2LCAiRmFpbGVkIHRvIGluaXRpYWxpemUgZW5jb2RlclxuIik7CgpQcmVmZXJhYmx5IHVz
ZSBkcm1fZXJyIGFuZCBkcm1fZGV2LgoKPiArCQlyZXR1cm4gcmV0Owo+ICsJfQo+ICAgCj4gICAJ
ZHJtX2VuY29kZXJfaGVscGVyX2FkZChlbmNvZGVyLCAmZXh5bm9zX2RwX2VuY29kZXJfaGVscGVy
X2Z1bmNzKTsKPiAgIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHBpLmMKPiBp
bmRleCAwZGMzNmRmNmFkYTMuLjRlNDJhMWRhODFkMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHBpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZHBpLmMKPiBAQCAtMTIsMTAgKzEyLDEwIEBACj4gICAjaW5jbHVkZSA8
bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+Cj4gICAKPiAgICNpbmNsdWRlIDxkcm0vZHJtX2F0
b21pY19oZWxwZXIuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fZW5jb2Rlci5oPgo+ICAgI2luY2x1
ZGUgPGRybS9kcm1fcGFuZWwuaD4KPiAgICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gICAj
aW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KPiAtI2luY2x1ZGUgPGRybS9kcm1fc2lt
cGxlX2ttc19oZWxwZXIuaD4KPiAgIAo+ICAgI2luY2x1ZGUgPHZpZGVvL29mX3ZpZGVvbW9kZS5o
Pgo+ICAgI2luY2x1ZGUgPHZpZGVvL3ZpZGVvbW9kZS5oPgo+IEBAIC0xNDAsNiArMTQwLDEwIEBA
IHN0YXRpYyB2b2lkIGV4eW5vc19kcGlfZGlzYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29k
ZXIpCj4gICAJfQo+ICAgfQo+ICAgCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJf
ZnVuY3MgZXh5bm9zX2RwaV9lbmNvZGVyX2Z1bmNzID0gewo+ICsJLmRlc3Ryb3kgPSBkcm1fZW5j
b2Rlcl9jbGVhbnVwLAo+ICt9Owo+ICsKPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29k
ZXJfaGVscGVyX2Z1bmNzIGV4eW5vc19kcGlfZW5jb2Rlcl9oZWxwZXJfZnVuY3MgPSB7Cj4gICAJ
Lm1vZGVfc2V0ID0gZXh5bm9zX2RwaV9tb2RlX3NldCwKPiAgIAkuZW5hYmxlID0gZXh5bm9zX2Rw
aV9lbmFibGUsCj4gQEAgLTE5NCw3ICsxOTgsMTMgQEAgaW50IGV4eW5vc19kcGlfYmluZChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4gICB7Cj4g
ICAJaW50IHJldDsKPiAgIAo+IC0JZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoZGV2LCBlbmNvZGVy
LCBEUk1fTU9ERV9FTkNPREVSX1RNRFMpOwo+ICsJcmV0ID0gZHJtX2VuY29kZXJfaW5pdChkZXYs
IGVuY29kZXIsICZleHlub3NfZHBpX2VuY29kZXJfZnVuY3MsCj4gKwkJCSAgICAgICBEUk1fTU9E
RV9FTkNPREVSX1RNRFMsIE5VTEwpOwo+ICsJaWYgKHJldCkgewo+ICsJCURSTV9ERVZfRVJST1Io
ZW5jb2Rlcl90b19kcGkoZW5jb2RlciktPmRldiwKCkl0IGp1c3QgZmFpbGVkIHRvIGluaXQgdGhl
IGVuY29kZXIsIHNvIGJldHRlciBub3QgdXNlIGl0IGhlcmUuIFRoZSAKZGV2aWNlIHNob3VsZCBi
ZSB0aGUgc2FtZSBhcyBwYXNzZWQgdG8gdGhlIGZ1bmN0aW9uIHZpYSAnZGV2Jy4KCj4gKwkJCSAg
ICAgICJmYWlsZWQgdG8gY3JlYXRlIGVuY29kZXIgcmV0ID0gJWRcbiIsIHJldCk7Cj4gKwkJcmV0
dXJuIHJldDsKPiArCX0KPiAgIAo+ICAgCWRybV9lbmNvZGVyX2hlbHBlcl9hZGQoZW5jb2Rlciwg
JmV4eW5vc19kcGlfZW5jb2Rlcl9oZWxwZXJfZnVuY3MpOwo+ICAgCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2RybV9kc2kuYwo+IGluZGV4IGM0ZDA5OGFiNzg2My4uNmI3NTYxYWM5YmIw
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYwo+IEBAIC0xMyw3
ICsxMyw3IEBACj4gICAKPiAgICNpbmNsdWRlIDxkcm0vYnJpZGdlL3NhbXN1bmctZHNpbS5oPgo+
ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+Cj4gLSNpbmNsdWRlIDxkcm0vZHJt
X3NpbXBsZV9rbXNfaGVscGVyLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX2VuY29kZXIuaD4KPiAg
IAo+ICAgI2luY2x1ZGUgImV4eW5vc19kcm1fY3J0Yy5oIgo+ICAgI2luY2x1ZGUgImV4eW5vc19k
cm1fZHJ2LmgiCj4gQEAgLTIyLDYgKzIyLDEwIEBAIHN0cnVjdCBleHlub3NfZHNpIHsKPiAgIAlz
dHJ1Y3QgZHJtX2VuY29kZXIgZW5jb2RlcjsKPiAgIH07Cj4gICAKPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fZW5jb2Rlcl9mdW5jcyBleHlub3NfZHJtX2RzaV9lbmNvZGVyX2Z1bmNzID0gewo+
ICsJLmRlc3Ryb3kgPSBkcm1fZW5jb2Rlcl9jbGVhbnVwLAo+ICt9Owo+ICsKPiAgIHN0YXRpYyBp
cnFyZXR1cm5fdCBleHlub3NfZHNpX3RlX2lycV9oYW5kbGVyKHN0cnVjdCBzYW1zdW5nX2RzaW0g
KmRzaW0pCj4gICB7Cj4gICAJc3RydWN0IGV4eW5vc19kc2kgKmRzaSA9IGRzaW0tPnByaXY7Cj4g
QEAgLTc5LDcgKzgzLDEwIEBAIHN0YXRpYyBpbnQgZXh5bm9zX2RzaV9iaW5kKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhCj4gICAJc3RydWN0IGRy
bV9kZXZpY2UgKmRybV9kZXYgPSBkYXRhOwo+ICAgCWludCByZXQ7Cj4gICAKPiAtCWRybV9zaW1w
bGVfZW5jb2Rlcl9pbml0KGRybV9kZXYsIGVuY29kZXIsIERSTV9NT0RFX0VOQ09ERVJfVE1EUyk7
Cj4gKwlyZXQgPSBkcm1fZW5jb2Rlcl9pbml0KGRybV9kZXYsIGVuY29kZXIsICZleHlub3NfZHJt
X2RzaV9lbmNvZGVyX2Z1bmNzLAo+ICsJCQkgICAgICAgRFJNX01PREVfRU5DT0RFUl9UTURTLCBO
VUxMKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiAgIAo+ICAgCXJldCA9IGV4eW5v
c19kcm1fc2V0X3Bvc3NpYmxlX2NydGNzKGVuY29kZXIsIEVYWU5PU19ESVNQTEFZX1RZUEVfTENE
KTsKPiAgIAlpZiAocmV0IDwgMCkKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHJtX3ZpZGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV92
aWRpLmMKPiBpbmRleCA2N2JiZjliOGJjMGUuLjU5ZGVhODUzZDM2NCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fdmlkaS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3ZpZGkuYwo+IEBAIC0xMywxMCArMTMsMTAgQEAKPiAg
IAo+ICAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgo+ICAgI2luY2x1ZGUgPGRy
bS9kcm1fZWRpZC5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9lbmNvZGVyLmg+Cj4gICAjaW5jbHVk
ZSA8ZHJtL2RybV9mcmFtZWJ1ZmZlci5oPgo+ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4K
PiAgICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgo+IC0jaW5jbHVkZSA8ZHJtL2Ry
bV9zaW1wbGVfa21zX2hlbHBlci5oPgo+ICAgI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+Cj4g
ICAjaW5jbHVkZSA8ZHJtL2V4eW5vc19kcm0uaD4KPiAgIAo+IEBAIC00MDMsNiArNDAzLDEwIEBA
IHN0YXRpYyB2b2lkIGV4eW5vc192aWRpX2Rpc2FibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNv
ZGVyKQo+ICAgewo+ICAgfQo+ICAgCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJf
ZnVuY3MgZXh5bm9zX3ZpZGlfZW5jb2Rlcl9mdW5jcyA9IHsKPiArCS5kZXN0cm95ID0gZHJtX2Vu
Y29kZXJfY2xlYW51cCwKPiArfTsKPiArCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNv
ZGVyX2hlbHBlcl9mdW5jcyBleHlub3NfdmlkaV9lbmNvZGVyX2hlbHBlcl9mdW5jcyA9IHsKPiAg
IAkubW9kZV9zZXQgPSBleHlub3NfdmlkaV9tb2RlX3NldCwKPiAgIAkuZW5hYmxlID0gZXh5bm9z
X3ZpZGlfZW5hYmxlLAo+IEBAIC00NDUsNyArNDQ5LDEzIEBAIHN0YXRpYyBpbnQgdmlkaV9iaW5k
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+
ICAgCQlyZXR1cm4gUFRSX0VSUihjdHgtPmNydGMpOwo+ICAgCX0KPiAgIAo+IC0JZHJtX3NpbXBs
ZV9lbmNvZGVyX2luaXQoZHJtX2RldiwgZW5jb2RlciwgRFJNX01PREVfRU5DT0RFUl9UTURTKTsK
PiArCXJldCA9IGRybV9lbmNvZGVyX2luaXQoZHJtX2RldiwgZW5jb2RlciwgJmV4eW5vc192aWRp
X2VuY29kZXJfZnVuY3MsCj4gKwkJCSAgICAgICBEUk1fTU9ERV9FTkNPREVSX1RNRFMsIE5VTEwp
Owo+ICsJaWYgKHJldCkgewo+ICsJCURSTV9ERVZfRVJST1IoZGV2LCAiZmFpbGVkIHRvIGluaXRp
YWxpemUgZW5jb2RlciByZXQgPSAlZFxuIiwKPiArCQkJICAgICAgcmV0KTsKCkFnYWluLCB5b3Ug
cmF0aGVyIHdhbnQgZHJtX2VycigpIHdpdGggZHJtX2RldiBoZXJlLgoKSSd2ZSBicmllZmx5IGxv
b2tlZCBvdmVyIHRoZSBzZXJpZXMgYW5kIG1hbnkgcGF0Y2hlcyBzZWVtIGFmZmVjdGVkLiAKUGxl
YXNlIHByZWZlciBkcm1fIGxvZ2dpbmcgZnVuY3Rpb25zIGFuZCBEUk0gZGV2aWNlcyBvdmVyIHRo
ZSBwbGFpbiAKZGV2aWNlIGVxdWl2YWxlbnRzLgoKQmVzdCByZWdhcmRzClRob21hcwoKCj4gKwkJ
cmV0dXJuIHJldDsKPiArCX0KPiAgIAo+ICAgCWRybV9lbmNvZGVyX2hlbHBlcl9hZGQoZW5jb2Rl
ciwgJmV4eW5vc192aWRpX2VuY29kZXJfaGVscGVyX2Z1bmNzKTsKPiAgIAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19oZG1pLmMKPiBpbmRleCAwOWIyY2FiYjIzNmYuLmY0NDU4NmNlMGZkZiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMKPiBAQCAtMzYsOSArMzYsOSBA
QAo+ICAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgo+ICAgI2luY2x1ZGUgPGRy
bS9kcm1fYnJpZGdlLmg+Cj4gICAjaW5jbHVkZSA8ZHJtL2RybV9lZGlkLmg+Cj4gKyNpbmNsdWRl
IDxkcm0vZHJtX2VuY29kZXIuaD4KPiAgICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gICAj
aW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KPiAtI2luY2x1ZGUgPGRybS9kcm1fc2lt
cGxlX2ttc19oZWxwZXIuaD4KPiAgIAo+ICAgI2luY2x1ZGUgImV4eW5vc19kcm1fY3J0Yy5oIgo+
ICAgI2luY2x1ZGUgInJlZ3MtaGRtaS5oIgo+IEBAIC0xNTc1LDYgKzE1NzUsMTEgQEAgc3RhdGlj
IHZvaWQgaGRtaV9kaXNhYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiAgIAltdXRl
eF91bmxvY2soJmhkYXRhLT5tdXRleCk7Cj4gICB9Cj4gICAKPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fZW5jb2Rlcl9mdW5jcyBleHlub3NfaGRtaV9lbmNvZGVyX2Z1bmNzID0gewo+ICsJLmRl
c3Ryb3kgPSBkcm1fZW5jb2Rlcl9jbGVhbnVwLAo+ICt9Owo+ICsKPiArCj4gICBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9lbmNvZGVyX2hlbHBlcl9mdW5jcyBleHlub3NfaGRtaV9lbmNvZGVyX2hl
bHBlcl9mdW5jcyA9IHsKPiAgIAkubW9kZV9maXh1cAk9IGhkbWlfbW9kZV9maXh1cCwKPiAgIAku
ZW5hYmxlCQk9IGhkbWlfZW5hYmxlLAo+IEBAIC0xODYyLDcgKzE4NjcsMTMgQEAgc3RhdGljIGlu
dCBoZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZv
aWQgKmRhdGEpCj4gICAKPiAgIAloZGF0YS0+cGh5X2Nsay5lbmFibGUgPSBoZG1pcGh5X2Nsa19l
bmFibGU7Cj4gICAKPiAtCWRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KGRybV9kZXYsIGVuY29kZXIs
IERSTV9NT0RFX0VOQ09ERVJfVE1EUyk7Cj4gKwlyZXQgPSBkcm1fZW5jb2Rlcl9pbml0KGRybV9k
ZXYsIGVuY29kZXIsICZleHlub3NfaGRtaV9lbmNvZGVyX2Z1bmNzLAo+ICsJCQkgICAgICAgRFJN
X01PREVfRU5DT0RFUl9UTURTLCBOVUxMKTsKPiArCWlmIChyZXQpIHsKPiArCQlEUk1fREVWX0VS
Uk9SKGRldiwgImZhaWxlZCB0byBpbml0aWFsaXplIGVuY29kZXIgcmV0ID0gJWRcbiIsCj4gKwkJ
CSAgICAgIHJldCk7Cj4gKwkJcmV0dXJuIHJldDsKPiArCX0KPiAgIAo+ICAgCWRybV9lbmNvZGVy
X2hlbHBlcl9hZGQoZW5jb2RlciwgJmV4eW5vc19oZG1pX2VuY29kZXJfaGVscGVyX2Z1bmNzKTsK
PiAgIAo+CgotLSAKLS0KVGhvbWFzIFppbW1lcm1hbm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKRnJhbmtlbnN0ci4gMTQ2LCA5
MDQ2MSBOw7xybmJlcmcsIEdlcm1hbnksIHd3dy5zdXNlLmNvbQpHRjogSm9jaGVuIEphc2VyLCBB
bmRyZXcgTWNEb25hbGQsIChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
