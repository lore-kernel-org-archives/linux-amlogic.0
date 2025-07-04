Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC9FC83F09
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jul 2025 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bh6WDu+VKd2vL2f9Vnt3o6lVm5OzYDSbdNctlFuq0AM=; b=cGOX2JI+k5HJX1
	jWsi69N2glxglgc8n0Aderb4gePDQWr7BS8AZ2ynbkCc/p/Iy/3YC0RKquR5T/WoJKI9qOoFnhi6e
	f+5/EgaTKl+dTqJpFYFf37eDqbkXIshKzd84B/agWOWIP95YML6TG8lYS/JtdvSDOd2mQub3rsVAl
	efjKxRh9RdmTDtzz822evK/yuCjTKWa2O+X8uvQZnP4Xcnx+mJc+yuzQz4BKM4dluD7q/CbXjDLu6
	qBdpxEAqn3udqAqBjZJsK7U2riuaqcanBAwb5HMFRn9+Qy4vs72uck66Mt8o+NZdSPrioKv+B5Bus
	CH/RpYNp7zVKIUoUDfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi7n-0000000En8o-2jhk;
	Fri, 04 Jul 2025 15:14:51 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi1x-0000000ElqN-0nz4
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Jul 2025 15:08:50 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a582e09144so594592f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Jul 2025 08:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641727; x=1752246527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GclhZB+I+gWjc1PWB+Tmja4z4M9XT8ugZhSsO+bEP7o=;
        b=cF58w540SFdg3SCF+3x672ttOEp+H5O7/t/b/4oYwJElkuKJLwUykKq8P2kslfUFXC
         cRTnkJj5sICbP9qYLhbwtQChXyi/D0I6u0qiCZm7kexmf/XLhW0rkG62zDwPIf2y3Oq0
         cihYO0cMgwlwPzk/hmJyGjANjhXiTTDzI2GBhqCRENFKgfKdRh9v5Xis15XoqIXnYpM4
         TDkuqCBbZUZyCotzchr9vky/oKO4NB7unBSYDxpi4FD0P54JTayYTyEP2tzPofos0D+3
         avpAF6zuPHKmLzmUrMhEgjsA0xbWxI7BGBPqqw6OGp2qZ4SiJ9Zw/joo6zfAiUyohLUe
         pj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641727; x=1752246527;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GclhZB+I+gWjc1PWB+Tmja4z4M9XT8ugZhSsO+bEP7o=;
        b=V/typmBqJwxhyVYNSWkNuiWyOY+y5+RnbCNaI0AGhUpv0/sN87io+TtqwcXtFJhnI8
         yNiUmUowL3xS5sqK5XCnPe61K0VK3c3i1ozaPxbrU5P1k4luEKdwiDGEfY1nxUXSxjUN
         fpOBMIi1DhkcMz8CIKNncVZeB909zwgpxBF2P1uKyuyCwotmkWlgkOeMFWrlkAaGxgiu
         fi7ser2cTnHpl6KLGWNVJLbeUn3ATr6Ov69ItLyAR35tPeso5ZFpDdZByGuVkRX8AVct
         JFVbQt4Bkvaat8Z77wWVARzApxzNOTLEL1m6IbRahfXw7dN63/ajkLuymYzCZGi90FNt
         I4UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiTtkI97KBrzk1OVYhEQFknMFxX1NXwrNBhjAPjLNu7BKjmS0w/XFPRdaFQZdAQtXin+1/20G/6UTaC0f6@lists.infradead.org
X-Gm-Message-State: AOJu0YzyzInYFbNZiJQF0GbRgIidJ810P8700G0ls45i2Vh8mibTJ2Y8
	Xq7o35yPlwzFkh3Xg0sTs7vMOe12by+54d6hWicoRXxYWBALhH8SB7cvC/BQM1AgYM4=
X-Gm-Gg: ASbGncvRQzf/sx79/rSv2RUAWjmpuQiJ3aw5VByMZwCv9BXM9D24y0MJqdp10j7K98V
	R8ENTMQUHxpoFvDrU64ekhP2ggc6F17+q3X+URRNWmjP+SCVqVI59a5Lj1fcrRRp+56brxYLl0t
	syz9khXckozxGpKAzzRBGTuP2Y2UemKmPHRhu91maEvOvpHcUnTQEQlKFBpGNvXwWRwkWVz4fCC
	kUYiLsGvKYSB3LAH2bg+y483pMkOrGyuL8MSY1fg+YLPpKTvFOOqfmUNYFilu/P8il+5AW1r29O
	PFO67uu9uMCHc9g1ztH5SndiT+yzLuEv/tQOvbwba+hOgqivhqX0HA4fVtW7V2rKOaCV9VEikjN
	bZonewKY=
X-Google-Smtp-Source: AGHT+IE7H9vRYfC7d4kJ+PSNtqfq+5KdOErVu7jZId1urOwLE5iqgduTgGoQI9kj0MA3An7JAcpEWQ==
X-Received: by 2002:a05:6000:2910:b0:3a4:ec23:dba7 with SMTP id ffacd0b85a97d-3b497038e99mr2076301f8f.31.1751641727135;
        Fri, 04 Jul 2025 08:08:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bead7csm57231595e9.39.2025.07.04.08.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:08:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
References: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
Subject: Re: [PATCH v3 0/2] arm64: Device Tree for Ugoos AM3 board
Message-Id: <175164172639.2841706.12481135333211530140.b4-ty@linaro.org>
Date: Fri, 04 Jul 2025 17:08:46 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_080849_241640_0CE770DA 
X-CRM114-Status: GOOD (  10.87  )
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

SGksCgpPbiBGcmksIDEzIEp1biAyMDI1IDE1OjM5OjEyICswMjAwLCBKLiBOZXVzY2jDpGZlciB3
cm90ZToKPiBUaGlzIHBhdGNoc2V0IGFkZHMgYSBkZXZpY2UgdHJlZSBmb3IgVWdvb3MgQU0zLCBh
biBBbmRyb2lkIFRWIGJveCBmcm9tCj4gMjAxOC4gTW9zdCBoYXJkd2FyZSBmdW5jdGlvbmFsaXR5
IGhhcyBiZWVuIHRlc3RlZCwgYXMgbm90ZWQgaW4gcGF0Y2ggMi8yLgo+IAo+IAoKVGhhbmtzLCBB
cHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2FtbG9naWMvbGludXguZ2l0ICh2Ni4xNy9hcm02NC1kdCkKClsxLzJdIGR0LWJpbmRpbmdzOiBh
cm06IGFtbG9naWM6IEFkZCBVZ29vcyBBTTMKICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9h
bWxvZ2ljL2MvZWY0OTFhYjdjYmY2YTQ2MDQ3NmE0MWQ4YjVkYmQ4YTQzOTQyODJiYQpbMi8yXSBh
cm02NDogZHRzOiBhbWxvZ2ljOiBBZGQgVWdvb3MgQU0zCiAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvYW1sb2dpYy9jL2IzM2Y4Y2ZiMmI0ZDkxYzRiYjdjMTZiMzU0MTM4Y2MyMDViZWZlZDIK
ClRoZXNlIGNoYW5nZXMgaGFzIGJlZW4gYXBwbGllZCBvbiB0aGUgaW50ZXJtZWRpYXRlIGdpdCB0
cmVlIFsxXS4KClRoZSB2Ni4xNy9hcm02NC1kdCBicmFuY2ggd2lsbCB0aGVuIGJlIHNlbnQgdmlh
IGEgZm9ybWFsIFB1bGwgUmVxdWVzdCB0byB0aGUgTGludXggU29DIG1haW50YWluZXJzCmZvciBp
bmNsdXNpb24gaW4gdGhlaXIgaW50ZXJtZWRpYXRlIGdpdCBicmFuY2hlcyBpbiBvcmRlciB0byBi
ZSBzZW50IHRvIExpbnVzIGR1cmluZwp0aGUgbmV4dCBtZXJnZSB3aW5kb3csIG9yIHNvb25lciBp
ZiBpdCdzIGEgc2V0IG9mIGZpeGVzLgoKSW4gdGhlIGNhc2VzIG9mIGZpeGVzLCB0aG9zZSB3aWxs
IGJlIG1lcmdlZCBpbiB0aGUgY3VycmVudCByZWxlYXNlIGNhbmRpZGF0ZQprZXJuZWwgYW5kIGFz
IHNvb24gdGhleSBhcHBlYXIgb24gdGhlIExpbnV4IG1hc3RlciBicmFuY2ggdGhleSB3aWxsIGJl
CmJhY2twb3J0ZWQgdG8gdGhlIHByZXZpb3VzIFN0YWJsZSBhbmQgTG9uZy1TdGFibGUga2VybmVs
cyBbMl0uCgpUaGUgaW50ZXJtZWRpYXRlIGdpdCBicmFuY2hlcyBhcmUgbWVyZ2VkIGRhaWx5IGlu
IHRoZSBsaW51eC1uZXh0IHRyZWUgWzNdLApwZW9wbGUgYXJlIGVuY291cmFnZWQgdGVzdGluZyB0
aGVzZSBwcmUtcmVsZWFzZSBrZXJuZWxzIGFuZCByZXBvcnQgaXNzdWVzIG9uIHRoZQpyZWxldmFu
dCBtYWlsaW5nLWxpc3RzLgoKSWYgcHJvYmxlbXMgYXJlIGRpc2NvdmVyZWQgb24gdGhvc2UgY2hh
bmdlcywgcGxlYXNlIHN1Ym1pdCBhIHNpZ25lZC1vZmYtYnkgcmV2ZXJ0CnBhdGNoIGZvbGxvd2Vk
IGJ5IGEgY29ycmVjdGl2ZSBjaGFuZ2VzZXQuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYW1sb2dpYy9saW51eC5naXQKWzJdIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQKWzNd
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGlu
dXgtbmV4dC5naXQKCi0tIApOZWlsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
