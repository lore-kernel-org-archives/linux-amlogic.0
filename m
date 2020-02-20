Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96BCC11D04
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 12:00:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B969320722
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 12:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mgy1Tldn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uiPbHKi5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B969320722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rs+GmimzzGi2gnjXPjEhHCG8VKp82+3Z/7/53exnoN0=; b=mgy1TldnYTHL4O
	5RnCqnAZuXuOBwR87c0AVsHGbw5KDGnVB7DDfzWFCYTBNbp3gwlJeEIa4b4crNx8f7QKHDR0X2zm2
	mB9TyOZDpwrOplFbX53uhXPWS25ZSl8VsoI3LdqXL4lG9y+aONdZcMaZj4letymO/oLm2lH2mKBMK
	FAv2aBYWeGTKg57iCnlbN1OECjA3Ycw0j+ZfQ3RnnOMA41NBrv7gUMFkv3UsFJ2eFMMpCD2/W12dN
	0+vMqWTqtaf7ckrQJ1vGhnuISgVvI+w3pwrG+pOeVMtuoLQ4+YTOAeyCGKGO9ZygEFJPK2Krr/5/7
	9Z66/DOwzuxTqNiyKyPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4kVC-0000N2-8k; Thu, 20 Feb 2020 12:00:22 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4kV9-0000MT-6e
 for linux-amlogic@lists.infradead.org; Thu, 20 Feb 2020 12:00:21 +0000
Received: by mail-vs1-xe43.google.com with SMTP id x18so2485222vsq.4
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Feb 2020 04:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2maRxbwaWQdYG4KYSFEZQXuW4XTvPWB6+BI1DcPAf7s=;
 b=uiPbHKi5ifQGd/+vU3Bg2bWwW7uLXfeb9jyg9h2kuFqSvFAb1meTuoyQT7Y9xyn+yh
 4GG01nAiQRzNFnEJrL47dFGQKR1BYAmbCJf+MfMsaxFYIJuOV/5vU6V05TXW0iicvMgx
 T7tuBRl0TROqcMMqKJh83gz12LnbkmlMWphR1KmZU8esWp5KmbFCQID1SH7M7DIdj/7e
 wjmfYeR4RdGMh8NA8mptJhe16sKbTGyIRlaVruSMOr7muGBwwGjUvNRt/vVGeEyq9xL0
 zYGcpP0qYWT/GA6N40zvpI8RYaTAIz4/1gP/YlGXbiNKi0PkhuHjxSgonlp/utReHYwp
 HLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2maRxbwaWQdYG4KYSFEZQXuW4XTvPWB6+BI1DcPAf7s=;
 b=ifIbbNISeMwvEngXwfMq911KnmBzhe52Rrl4hoAACXK4xS/a7ylwg489TjtSMWhueH
 HKzthoj6Jrzrhoxtf7Af8pegB7JF7SOe3uE0IQ4f7Hk4nDtIl8HKzKsGeNJDaJ3cjBSM
 iwYDyMezf3v8w4GYwzmN6I9x50S9aYMJyJ4KK0OgRxG/E34oW/oKagZHRW/LWR6JgWOZ
 ZyxSYawX/Cx/6CuOzgFZMiUj3r9qYE0sZonfAUzcjcNyqMuHxEnLR8/I2MPOEZarzcdo
 WUps1bINXqJK2LPEkkM1nbM0NKkE3+wBZVtD4XGlrG6chpEtB89at7q2GnrS5Mcxpn9+
 mcxA==
X-Gm-Message-State: APjAAAXIUYnQA6SVrvV1CgF431DV+rRmaRO1ngXvfj0Ax7mVRHRYHET4
 jm+GifnH7A3LeQgqdNCTxmSc/Up/X2Lb6ssCqIY=
X-Google-Smtp-Source: APXvYqxXNcOfGZ2acPaakwTwE7nSVQySWcCd6QGUbcsKuezSgJtJAGBBcyUTM0+jsTO+dzIDRVrFr42LH1TZAFyMVv0=
X-Received: by 2002:a67:c204:: with SMTP id i4mr17663271vsj.118.1582200016567; 
 Thu, 20 Feb 2020 04:00:16 -0800 (PST)
MIME-Version: 1.0
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20200219203544.31013-5-ville.syrjala@linux.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 20 Feb 2020 12:00:04 +0000
Message-ID: <CACvgo52gOX7OioTqaLUEi1Luc49y2FpREv5ERRP5DPYxodRMLw@mail.gmail.com>
Subject: Re: [PATCH 04/12] drm: Nuke mode->vrefresh
To: Ville Syrjala <ville.syrjala@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_040019_246630_118D1D48 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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
 ML nouveau <nouveau@lists.freedesktop.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Icenowy Zheng <icenowy@aosc.io>, Jonas Karlman <jonas@kwiboo.se>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-amlogic@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxOSBGZWIgMjAyMCBhdCAyMDozNiwgVmlsbGUgU3lyamFsYQo8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IEdldCByaWQgb2YgbW9kZS0+dnJlZnJlc2gg
YW5kIGp1c3QgY2FsY3VsYXRlIGl0IG9uIGRlbWFuZC4gU2F2ZXMKPiBhIGJpdCBvZiBzcGFjZSBh
bmQgYXZvaWRzIHRoZSBjYWNoZWQgdmFsdWUgZ2V0dGluZyBvdXQgb2Ygc3luYwo+IHdpdGggcmVh
bGl0eS4KPgo+IE1vc3RseSBkb25lIHdpdGggY29jY2ksIHdpdGggdGhlIGZvbGxvd2luZyBtYW51
YWwgZml4dXBzOgo+IC0gUmVtb3ZlIHRoZSBub3cgZW1wdHkgbG9vcCBpbiBkcm1faGVscGVyX3By
b2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMoKQo+IC0gRml4IF9fTU9ERSgpIG1hY3JvIGluIGNo
NzAwNl9tb2RlLmMKClNwZWFraW5nIG9mIGNoNzAwNl9tb2RlLmMsIGl0IGhhcyBpdHMgb3duICJm
aXhlZCB2cmVmcmVzaCIsIHdoaWNoCmRvZXNuJ3Qgc2VlbSB0byBiZSB1c2VkIGFueXdoZXJlLgpP
bmUgY291bGQgcG90ZW50aWFsbHkgbnVrZSBpdCwgYWx0aG91Z2ggaXQgY2FuIGJlIGEgY29tcGxl
dGVseSBzZXBhcmF0ZSBwYXRjaC4KClRoaXMgcGF0Y2ggaXM6ClJldmlld2VkLWJ5OiBFbWlsIFZl
bGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKLUVtaWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
