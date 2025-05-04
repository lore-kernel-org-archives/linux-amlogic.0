Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18EFC3ABB7
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 May 2025 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qL7KCsVIl9alkRUFmzby+WEEUXHFFIE8I/11LEnF5eA=; b=EnM/wRTSTzmQ0y
	gf0yqrGaeY4/JmczMZ6X0J89aGT5I4aMcxD7pUnwpZ6wO9m5+CrusdSBOYHYmf2+YhzpLHLdjnPd4
	PbkcaD/Ai7VZVug7F3rKrB+CqBbCe9z4ft+JZhRN1Tn9GayO098Fl8Fd8Hj2CcX68UkDC88CuZdi7
	uyATFDjU6LsU7M1B3XcHhZMT06arZgiWPQXyGhbIurbsDJgDDGToGqQRmqlwzmMzl7llYUVKMTZGO
	35PKNm3kMqp47V7vprdmXrRY53IYb6n1GP7hh985WYHR9KhmRnMGPj8h6FUwZcsuMzzQxlAxHBv04
	1Lz8cLwsDJf8pvAW4xBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgbR-00000005xmV-0bKH;
	Sun, 04 May 2025 21:10:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgYd-00000005xUC-0f5q;
	Sun, 04 May 2025 21:07:32 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-224171d6826so55091715ad.3;
        Sun, 04 May 2025 14:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746392850; x=1746997650; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUnzwvptOByim/ucOYr6TfZ9ss3/DQ7PxM0faURq4oo=;
        b=PTIM1YtPXKtQg4V3bbWwErfzgnoMhq7R8UpnvfsGpa/nIukvYp2HVVRP1280mgWx51
         +qiaRBOLpn40rLm9lkpQx1olVVKyGE8PEN4POPfoM/SVLoaXyDJx39sp+2v4cYUb1DYX
         S+Cg1LgSlt6MY/q2Jvg/PwcGtDVkAVPs73noUX183J0Pocxhg2mHWR/2hkxGriZcZqO+
         tSZQ5aFGF1NBRMo1fx3Oy/Ljx+nFB7+fb5gMcLQFVA+bmpmrhf12GD0X51II8g6Ca9L+
         53yUkJYMhV7he2XhkU7yOR2qAaCDH5Rd7JXa4VfGy/327vYyCuMuxl6B5/H/GuUZpDAN
         TxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746392850; x=1746997650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUnzwvptOByim/ucOYr6TfZ9ss3/DQ7PxM0faURq4oo=;
        b=uXxry202REDnUd8aVPE4Qb7qlC95ONHAaLXi/yr1SoDSu+tDt846MP1PJYWeLPz16W
         yHCJTolv7DrJdqp4OkSUUzAo1CEFTFbHb6wpRcsG/AlxyezsUrhPcLkMjBPWTH+gnrPI
         /TJlikZrKgDIgU6HdJ8E+SPuPGhnJzDOjqORTAvDbZGa2HZ3Nt4UjtGkNJGKIENW3HQE
         jENrS0Ps5YG/jsKkJJ3roa9EC/dUiWoRfn1rx7aJuA38eZ+/GF38cRfB66UQ5YwUqPCI
         PHI6DwzYcMFNzzaTeV9k/FW4BRedOxZR9pPIqV5ZXVqc6vjU1+5DXV6ZphPlgIddUv5J
         41Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUFm413PFWGjRIhbc+p+M9/OHuRMXIildpvvCLwMqs0ODMBGeQ334q9/Mno4je8ZVUGLximpfO7l5v9nwnXQfqK9Q==@lists.infradead.org, AJvYcCVyiouuzVveIcd17NG1UGXPlEtdQr83+YiV0rAHzNoseTuN9Hhf/f36kwyJyQjMaqL3lVDwN32XegoS/q5y@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5z2y5pbxNdHc0d+COUWWdN8X6QOEPJ/rQYM67PTEH10M1ZOow
	NoZOtmcbQwL9/MDtxfJMXHG2FrVC1av/iOVRs+xMe24X4/Oqny+jPvmNMGQ+8JKjVj8/PMunRyr
	PmSyMgXFtp7Lcxh6FuFWgXHBgXVE=
X-Gm-Gg: ASbGncvZPq7U5qnl9oPnx5LMImYAaJxbwqJsk5idhjdtRRqflV49THz5GqmFkTPiEbB
	UrQT0WCi/YDOZKU3yElaZ8JVtZjzoSXLYVYxmo8jnXtUwd9vUslip1p5OjUgVGgwy7mTu6ewHGO
	Zxhmf8EC4RYPD7mQ+/IqiXPIq26u0LlL1OdYEoaLBICKUJasJzjAbpkJU=
X-Google-Smtp-Source: AGHT+IE4yCRULV8L0X001s3hseepDxE2pMX59fNpwmKQdirlnzPxqBjXHGsiaArFgHU3ITvCieH+XPwI6UqVlx0sRJ4=
X-Received: by 2002:a17:903:11c8:b0:223:f9a4:3fb6 with SMTP id
 d9443c01a7336-22e1e8c3ee0mr62089055ad.11.1746392850175; Sun, 04 May 2025
 14:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250503084443.3704866-1-christianshewitt@gmail.com>
In-Reply-To: <20250503084443.3704866-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:07:18 +0200
X-Gm-Features: ATxdqUG9_zNauUndvpj8bS3vMeW4x8DGoy38X_LVK07lpYOYelvTZu9YHJNhxnA
Message-ID: <CAFBinCCcGk9dRUp8yj740OMcgcck2iWe_cN-J0jOt5M74+zBgA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: dreambox: fix missing clkc_audio node
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Emanuel Strobel <emanuel.strobel@yahoo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_140731_197254_ADF59A9F 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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

T24gU2F0LCBNYXkgMywgMjAyNSBhdCAxMDo0NOKAr0FNIENocmlzdGlhbiBIZXdpdHQKPGNocmlz
dGlhbnNoZXdpdHRAZ21haWwuY29tPiB3cm90ZToKPgo+IEFkZCB0aGUgY2xrY19hdWRpbyBub2Rl
IHRvIGZpeCBhdWRpbyBzdXBwb3J0IG9uIERyZWFtYm94IE9uZS9Ud28uCj4KPiBGaXhlczogODNh
NmY0YzYyY2IxICgiYXJtNjQ6IGR0czogbWVzb246IGFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIERy
ZWFtYm94IE9uZS9Ud28iKQo+IENDOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiBTdWdnZXN0
ZWQtYnk6IEVtYW51ZWwgU3Ryb2JlbCA8ZW1hbnVlbC5zdHJvYmVsQHlhaG9vLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4K
UmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29v
Z2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
