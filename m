Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE04AC369C9
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Apr 2025 21:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PP2WAxek6V7hArur2dOztdQKV8LxLrtoERvJS/oDcLo=; b=YSIMjmCk/CUCfc
	fCmuhJkNtw+Y3T36ds7TGtVo8flm6ZOfa7zlaOdGEgBIBsB8IixVUdyHiMaHFT0JjsxslLSWI1onq
	KqNDWY3znhuhStYNC1e6tfs2rztpFnlCbO0yEsFtE94gnoiYk4YnxBZ4YgyvNvfE613UFH3BVYZH7
	xz7Nhx1go2XP4E5kyVuSyG1hyHjOiAd8bKqkumENc5AWwlcZpa+QrCb09AmYQOQJEGkkS/daDASvw
	wvomfpXjdx1oQbP2qv3lO4p7CHUe3fZr6PhVbYfKIDYU0F+keun0roaDipTCPF4HW2ZbKmcx9Y3ZJ
	cTtDcRySMZunTluMCcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Fno-00000001pcn-0Hpf;
	Sat, 19 Apr 2025 21:32:44 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Fnl-00000001pcI-012j;
	Sat, 19 Apr 2025 21:32:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-224191d92e4so30127025ad.3;
        Sat, 19 Apr 2025 14:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745098358; x=1745703158; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOpxvDT2hzdXC/Lk44TDPK4RjDKnxL5gg9PE5JOWs0E=;
        b=lo+DGzdGTycWGGIunvTmAiSYEp9CK5MT119jW680ujPfdkzU2Be2588jP0/B5w44wo
         1Fop0uijbLI+/yyyKgU3RieMXS1YTffvi1zQIb1sGoib1EEyssClA4RZXQOmJO2q7QjL
         FOrM7YxdR0/qHHHajYoQgjoon+KYHpStAMcmMZFTAGhrsLdkk611DJt9tzb4baaI3SkI
         3L3/YdspA2gAO2i5lFcXAG4R1igSlwIYdi/ytC9IK5wC9mqxuV0kN32R70FTL9Ml90qp
         XcL+xiGRHppniYHOj3ROQg/SEWGUsWFUU6lOnnw/wq3NZY8yp/xUK8wTRUL7EaODrZ++
         GbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745098358; x=1745703158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOpxvDT2hzdXC/Lk44TDPK4RjDKnxL5gg9PE5JOWs0E=;
        b=Ez4DiP358LIdT4z/YHVPDsQ0PnSB0QOIkXMKiWT+tzA+c16X1Te/SYmCR0CT7LRPF3
         SVwNYc2iTRNyzV5Bwa6Qp8MWney0Qs4PPM0YVdVoHRc0e/WyCT8QgRzn4KJhIujHPJQ3
         +RKoDob4saTeYjN6Bu0ivLC7uF0iRMf31eOlIaYyV2mzxWrAKhUlmfKFtGHBFlTR6Ace
         UKLAAn+31rUJSkv902oPaBtrAuIh4C1R7kDM8eLO8L2zCsyT7IH8RFV8q62YDmuzwdoJ
         BzmTNcNoGFZnZt8RFkYHdwxq7Y70vkg8VUj9ugvxEbGQLTusTStJiExEoZIaSR9pJPvI
         5aVA==
X-Forwarded-Encrypted: i=1; AJvYcCUqXhZrb3VraPrsp5+xMH2zPAlNEwDnJXU942Av1rLiIxQ23q2EJMFkgW60hSNC6m7Ysukr19T6ObnTlwkYx7o4@lists.infradead.org
X-Gm-Message-State: AOJu0YwUwh572z2usKzvZSUUErl8OurrzKULYqEr02F53/4+Hb6pPZQV
	ktT/vH2mjAwFc6kuMk3LiHxPDHX4g+ra6Jj5OXT3OH3SuPxXO4KDujz0XMzOTIQ5e2zNY7VHALN
	/yHLklyOms1eFmVoyiy22sjbAklw=
X-Gm-Gg: ASbGncso9mRqRXa/SxMiwuGpSOSWsOoY2jLELvKa+/KkZ3y6sYBYLQiykgX/XsaPVn0
	hZq6wxUFtRvdr4Zsmjmc1hClb671kcxSiaxrvDVzjla1SMoSX6YOGY14sIv3+LnuZZy8aSHEkxy
	uY9KnBe9Mc1iueurXdypp5QSlcvEF8E3ypygeU
X-Google-Smtp-Source: AGHT+IGLlR8UcPQM775uZfby4awG21f1XTwAj2dFL/MhOfyAEZBG0daUZpkUnTjuqdZFSKrcnfs7NqueiXGk5h+tOx0=
X-Received: by 2002:a17:903:98f:b0:224:f12:3746 with SMTP id
 d9443c01a7336-22c535aca10mr96258145ad.30.1745098358068; Sat, 19 Apr 2025
 14:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com> <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
In-Reply-To: <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 19 Apr 2025 23:32:27 +0200
X-Gm-Features: ATxdqUEyKysz5d6KQERLrTW5mLuoTSOc_4gWR0BkMuxJYXGSMde_moYAT3tKcVQ
Message-ID: <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master()
 on error
To: linux@martijnvandeventer.nl, neil.armstrong@linaro.org
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_143241_061951_FE3AA9FA 
X-CRM114-Status: GOOD (  22.56  )
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

SGkgTWFydGlqbiwgSGkgTmVpbCwKCk9uIFRodSwgQXByIDEwLCAyMDI1IGF0IDg6NDbigK9QTSA8
bGludXhAbWFydGlqbnZhbmRldmVudGVyLm5sPiB3cm90ZToKPgo+IEhpIE1hcnRpbiwKPgo+IFRo
YW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+Cj4gSSBlbmNvdW50ZXJlZCB0aGlzIGlzc3VlIHNvbWUg
dGltZSBhZ28gYXMgd2VsbCBhbmQgaGFkIGEgcG9zc2libGUgZml4IGluIG15IHRyZWUgKHNlZQo+
IGJlbG93KS4KPiBNeSBhcG9sb2dpZXMgZm9yIG5vdCB1cHN0cmVhbWluZyBpdCBlYXJsaWVyLgpO
byB3b3JyaWVzLCB3ZSdyZSBhbGwgYnVzeSB3aXRoIGJvdGgsIG9mZmxpbmUgYW5kIG9ubGluZSBs
aWZlIDstKQoKPiBXaGlsZSBteSBmaXggaXMgbm90IGFzIHN5bW1ldHJpYyBhcyB5b3Vyc+KAlEkg
bGlrZSBzeW1tZXRyeeKAlGl0IGlzIHNvbWV3aGF0IHNpbXBsZXIuIEl0Cj4gZGlkIG1ha2UgdGhl
IGFzc3VtcHRpb24gdGhhdCBvbmx5ICBjYWxsaW5nIGNvbXBvbmVudF91bmJpbmRfYWxsKCkgd2Fz
IGF0IGZhdWx0IGFuZCB0aGUgdGhlIHJlc3Qgb2YgdGhlCj4gY29kZSB3YXMgY29ycmVjdC4gVGhl
cmVmb3JlLCBjYWxsaW5nIG9uZSBvZiB0aGUgZm9sbG93aW5nIGZ1bmN0aW9uczoKPiBtZXNvbl9l
bmNvZGVyX2RzaV9yZW1vdmUoKQo+IG1lc29uX2VuY29kZXJfaGRtaV9yZW1vdmUoKQo+IG1lc29u
X2VuY29kZXJfY3Zic19yZW1vdmUoKQo+IGluIGNhc2UgdGhlaXIgY291bnRlcnBhcnQgd2FzIG5v
dCBjYWxsZWQsIHNob3VsZCBub3QgcmVzdWx0IGluIGFueSBpc3N1ZXMuCj4KPiBJIGp1c3QgdmVy
aWZpZWQsIGFuZCwgYXMgZmFyIGFzIEkgdW5kZXJzdGFuZCwgYWxsIG9mIHRoZXNlIGZ1bmN0aW9u
cyBkbyBhIGNoZWNrIHRvIGNvbmZpcm0KPiB3aGV0aGVyIHRoZSBlbmNvZGVyIHdhcyBpbml0aWFs
aXplZCBiZWZvcmUgcHJvY2VlZGluZyB3aXRoIGNsZWFudXAuClllcCwgdGhhdCBzZWVtcyB0byBi
ZSB0aGUgY2FzZSByaWdodCBub3cuCk5laWwsIHdvdWxkIHlvdSBsaWtlIE1hcnRpam4ncyBtb3Jl
IHNpbXBsZSBhcHByb2FjaCB3aXRoIGEgRml4ZXMgdGFnCmFuZCBiYWNrcG9ydCB0aGF0PwpUaGVu
IEknZCBzZW5kIG15IHBhdGNoIGFzIGEgc21hbGwgY2xlYW51cCB3aGljaCBkb2Vzbid0IGhhdmUg
dG8gYmUKYmFja3BvcnRlZC4gT3RoZXJ3aXNlIEknZCBzcGluIGEgdjIgd2l0aCBhIGZpeCBmb3Ig
dGhlIGlzc3VlIHRoYXQKTWFydGlqbiBmb3VuZCAoYW5kIGluY2x1ZGluZyBBbmFuZCdzIFJldmll
d2VkL1Rlc3RlZC1ieSk/CgpbLi4uXQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZXNvbi9tZXNvbl9kcnYuYwo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMK
PiA+IGluZGV4IDgxZDJlZTM3ZTc3My4uMDMxNjg2ZmQ0MTA0IDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fZHJ2LmMKPiA+IEBAIC0zMTQsMzUgKzMxNCwzNSBAQCBzdGF0aWMgaW50IG1l
c29uX2Rydl9iaW5kX21hc3RlcihzdHJ1Y3QgZGV2aWNlCj4gPiAqZGV2LCBib29sIGhhc19jb21w
b25lbnRzKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZHJtLT5kZXYsICJDb3Vs
ZG4ndCBiaW5kIGFsbAo+ID4gY29tcG9uZW50c1xuIik7Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgLyogRG8gbm90IHRyeSB0byB1bmJpbmQgKi8KPiA+ICAgICAgICAgICAgICAgICAgICAgICBo
YXNfY29tcG9uZW50cyA9IGZhbHNlOwo+Cj4gQWJvdmUgdHdvIGxpbmVzIGFyZSBubyBsb25nZXIg
dXNlZCwgc28gY2FuIGJlIHJlbW92ZWQuCldlbGwgc3BvdHRlZCwgdGhhbmsgeW91IQoKCkJlc3Qg
cmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
