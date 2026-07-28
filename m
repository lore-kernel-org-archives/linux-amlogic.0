Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F02C54F4D
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Jul 2026 16:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAORNvzQEyZdQlyo4o4WxKfeY/0XriU6+uwbfeunM/c=; b=u9V3oWH3zRorOB
	cu/L8h9lcXYDIVGB6vLghkXBdDw3YwI7YkUOK2PDkbGjrjSAy0ieR2tHhPsIgHVNDJeaQVoxolxuL
	Ilg/J0ucpogz6QqvvQBQsIX+83f3KxkmXI7agLGZe3qYzfxvC61FDM2Dm+rwz6VQA1B+q+9H3TQvH
	H2u2dEyFrAou2p4Uqm9wInzMn+f//ngbeE+UxkKOrn0CGs/tZDPuxZvrTwHmv9sa65Sss1tHXWGr/
	no/XQ5tscvQFT+VZKXufy8+HBtlrNjO0wvYexkVEbUgPgmXkzVVBqiYpSao/mRhPwJGRijRfwuz8Q
	l+kSs9tqeazREos0iH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokaI-00000005ov1-1Z5e;
	Tue, 28 Jul 2026 16:23:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokaG-00000005otx-3SfP
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Jul 2026 16:23:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E67B175D
	for <linux-amlogic@lists.infradead.org>; Tue, 28 Jul 2026 09:23:08 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 031453F763
	for <linux-amlogic@lists.infradead.org>; Tue, 28 Jul 2026 09:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785255792; bh=MuoYv/trvB+apkFilFU7ge8EmIYL0Cz7Mp4H5bYBY04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TInLXoX5Q3AsXt5zPzhlVZtV61Cn7rujxqDWEMKashFDVEUAPPl4esrz376FmO2wU
	 NhVfp+m/vqUmjnWGUxdi4qQPeimur1h3BWos2Ka95r3hCEzSfc3LbkE9eveTmg9nAS
	 13StgMkjACvyUU3M+Yw9Dk5VGoNDwpJQ8lQyNrSY=
Date: Tue, 28 Jul 2026 17:21:58 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Michal Simek <michal.simek@amd.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
	Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 12/15] drm/arm/komeda: remove dependency on DRM simple
 helpers
Message-ID: <amjXJrbgka00CQX2@e142607>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-12-a78c509e3062@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260719-drm_simple_encoder_init-v1-12-a78c509e3062@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_092312_935315_520F83F6 
X-CRM114-Status: GOOD (  17.79  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKdWwgMTksIDIwMjYgYXQgMDE6MzU6NDNBTSArMDIwMCwgRGlvZ28gU2lsdmEgd3Jv
dGU6Cj4gVGhlIHNpbXBsZSBLTVMgaGVscGVycyBhcmUgZGVwcmVjYXRlZCBiZWNhdXNlIHRoZXkg
b25seSBhZGQgYW4KPiBpbnRlcm1lZGlhdGUgbGF5ZXIgYmV0d2VlbiBkcml2ZXJzIGFuZCBhdG9t
aWMgbW9kZXNldHRpbmcuCj4gCj4gT3Blbi1jb2RlIGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KCkg
YnkgY2FsbGluZyBkcm1fZW5jb2Rlcl9pbml0KCkKPiBkaXJlY3RseSBhbmQgcHJvdmlkaW5nIGRy
aXZlci1sb2NhbCBkcm1fZW5jb2Rlcl9mdW5jcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEaW9nbyBT
aWx2YSA8ZGlvZ29tcGFpc3NpbHZhQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBMaXZpdSBEdWRh
dSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyB8IDkgKysrKysr
Ky0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMu
Ywo+IGluZGV4IGU4Y2I3ODJhNmY4ZS4uNzE5NTY4ZDlmN2MyIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+IEBAIC0xMSw5ICsx
MSw5IEBACj4gIAo+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMuaD4KPiAgI2luY2x1ZGUgPGRy
bS9kcm1fYXRvbWljX2hlbHBlci5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9lbmNvZGVyLmg+Cj4g
ICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5o
Pgo+IC0jaW5jbHVkZSA8ZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5oPgo+ICAjaW5jbHVkZSA8
ZHJtL2RybV9icmlkZ2UuaD4KPiAgCj4gICNpbmNsdWRlICJrb21lZGFfZGV2LmgiCj4gQEAgLTYz
NSw2ICs2MzUsMTAgQEAgc3RhdGljIGludCBrb21lZGFfYXR0YWNoX2JyaWRnZShzdHJ1Y3QgZGV2
aWNlICpkZXYsCj4gIAlyZXR1cm4gZXJyOwo+ICB9Cj4gIAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9lbmNvZGVyX2Z1bmNzIGtvbWVkYV9lbmNvZGVyX2Z1bmNzID0gewo+ICsJLmRlc3Ryb3kg
PSBkcm1fZW5jb2Rlcl9jbGVhbnVwLAo+ICt9Owo+ICsKPiAgc3RhdGljIGludCBrb21lZGFfY3J0
Y19hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCj4gIAkJCSAgIHN0cnVjdCBrb21lZGFf
Y3J0YyAqa2NydGMpCj4gIHsKPiBAQCAtNjU4LDcgKzY2Miw4IEBAIHN0YXRpYyBpbnQga29tZWRh
X2NydGNfYWRkKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLAo+ICAJICogYnJpZGdlCj4gIAkg
Ki8KPiAgCWtjcnRjLT5lbmNvZGVyLnBvc3NpYmxlX2NydGNzID0gZHJtX2NydGNfbWFzayhjcnRj
KTsKPiAtCWVyciA9IGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KGJhc2UsIGVuY29kZXIsIERSTV9N
T0RFX0VOQ09ERVJfVE1EUyk7Cj4gKwllcnIgPSBkcm1fZW5jb2Rlcl9pbml0KGJhc2UsIGVuY29k
ZXIsICZrb21lZGFfZW5jb2Rlcl9mdW5jcywKPiArCQkJICAgICAgIERSTV9NT0RFX0VOQ09ERVJf
VE1EUywgTlVMTCk7Cj4gIAlpZiAoZXJyKQo+ICAJCXJldHVybiBlcnI7Cj4gIAo+IAo+IC0tIAo+
IDIuNTQuMAo+IAoKLS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtlIHRvIHwK
fCBmaXggdGhlIHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1lIHRoZSAg
IHwKIFwgc291cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOODhClfL8Kv
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
