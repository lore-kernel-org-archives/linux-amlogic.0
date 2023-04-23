Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21372C77B60
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Apr 2023 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Dn6yQL7qDV1xsB8RCvynqEw3mYPSUZD1AqwRqJmJS4=; b=oQlSFjJuruZAX/
	Ltccomez8dnLSh1j/g7FepagTrGFOBkZdd6McmETZ7ODHhV5NU9DxOOMXHIp5SQbTajZGPY7AyhTb
	6W46Md34M+xPqMET1bHdZx43N38BJu9unxKzdaqRtTNc376qFgxSsXvC6g0FFkpjZ4sPEYbu3jGVB
	hy0n/rZZfdLMewAHjLQSbGMi00EyPFTxGzACoU+iQkbrkl+emrFKQLLOGmyMYG3SCYrJzZ444Ba5L
	k9+orS9kFJTRPygpXAVcxNARou7nAoe9sbrPc6QKHGDJpQmRqtka++QA1rhic2ShxgcE4HRVgSROO
	HnOQAHgZBelPscl+cS0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqdlf-00Eaoi-1w;
	Sun, 23 Apr 2023 17:44:55 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqdlb-00EanU-34;
	Sun, 23 Apr 2023 17:44:53 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-94f32588c13so491704566b.2;
        Sun, 23 Apr 2023 10:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682271890; x=1684863890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2eZs5d+yVYnpxqNGueuhOSq99ZCnZL+HNxoe/Z4agM=;
        b=rjqeblxUeHVA3FZXcGzBaljlFy+iD9hOhIVMbswTw1D0Fs7UgxpMc31Yrc7WS0WGEZ
         JcrwKlogGIp/aGiRxV3PAzhb9BhxPNRFIc3j2pdAvrLUOjPu+zdusbH11OXaua1HjHOr
         8Kqbe8c/e1TAQpv+YqZgt4chohNPwserwMyXfU0lBm/lKpSFwEAfqZy/tyDyD0Rbm/W7
         6R3WzmTBOwMpYMQHQp208GwYRvXw79xZGDOld3dyyi7rnv8Nz6vckPLwqGQJw0AG2h9r
         ME57w1b/0sd2ur9wSPLsQ/iaT6r1Kk1Hry3OC6Qy5OeXevjepT+H+hsKOVJbsS90KICX
         yXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682271890; x=1684863890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2eZs5d+yVYnpxqNGueuhOSq99ZCnZL+HNxoe/Z4agM=;
        b=ceD8nPIoxPzTt8LTZ2n/hwGEOoM7SSZQ6BPqPHZJZtL5S1pz8KtlGNCwO5EXvkyMM7
         PTu3nEewLGGKiC+ZESHptB1DuReZ9WTBZC/kA4TSvksk+/SaPuGFrSGj2uX0fFTbjtIp
         A+SKnEzoW8s4/WV+zVAzPa6OiVOhkz/yDzrB5nd8POGrDZmYsWW0UUHcNj8v3MHqcuJ7
         JIOXPZZQbbcgYk4tVS7IhvxMGfHfx23tRYVIU7UvsR0QYwDfqzVkp/G8/3LrW80QZTH/
         8ZQ99tPpilHnowQVnvpXjhrvTHAy96IcEENciFkiDFz5+NqEvThkurBKyv46atLYlrSx
         9AVw==
X-Gm-Message-State: AAQBX9d9Bo0nGcuLo5Pjd7nB9dRKyXzw74G/nrn4W+r4QGK+OQFVqHtZ
	xBU3baBDgM6Mo4yWeyLFw1hyjRYnz3HDFrSyvq4=
X-Google-Smtp-Source: AKy350Yo/Wifs+wSbwTN2k3fAqY1hgLXvfYw6V6t8pAvGLfxaJWtmONvcwDW+X7DbaDJ74PlKE59PJasQPemi3Dnt5E=
X-Received: by 2002:a17:907:8a18:b0:94a:5c6d:3207 with SMTP id
 sc24-20020a1709078a1800b0094a5c6d3207mr9914041ejc.44.1682271889923; Sun, 23
 Apr 2023 10:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230418111612.19479-1-ddrokosov@sberdevices.ru> <20230418111612.19479-5-ddrokosov@sberdevices.ru>
In-Reply-To: <20230418111612.19479-5-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 Apr 2023 19:44:39 +0200
Message-ID: <CAFBinCBF-KPxjG=uXQL9WqY+NPhFp1sXH43qM3t+LLRP9oEBkQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] usb: dwc3-meson-g12a: support OTG switch for all
 IP versions
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, mturquette@baylibre.com, 
	vkoul@kernel.org, kishon@kernel.org, hminas@synopsys.com, 
	Thinh.Nguyen@synopsys.com, yue.wang@amlogic.com, hanjie.lin@amlogic.com, 
	kernel@sberdevices.ru, rockosov@gmail.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-phy@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_104451_993143_DBB5A335 
X-CRM114-Status: GOOD (  10.10  )
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

T24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgMToxNuKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+Cj4gRnJvbSBub3csIHRoZSBBbWxvZ2ljIEExIFVT
QiBjb250cm9sbGVyIGlzIGNhcGFibGUgb2Ygc3dpdGNoaW5nIGJldHdlZW4KPiBob3N0IGFuZCBn
YWRnZXQgbW9kZXMgYmFzZWQgb24gdGhlIHN0YXR1cyBvZiB0aGUgT1RHX0lEIHNpZ25hbCBvciB2
aWEKPiBtYW51YWwgVVNCIHJvbGUgY2hhbmdlLgo+IFByZXZpb3VzbHksIG9ubHkgdGhlIEFtbG9n
aWMgQTEgSVAgdmVyc2lvbiBkaWQgbm90IHVzZSBPVEcgc3VwcG9ydCBmb3IKPiBob3N0IG9ubHkg
bW9kZSwgYnV0IHRoaXMgaXMgbm8gbG9uZ2VyIGFwcGxpY2FibGUuCj4gVGhlcmVmb3JlLCB0aGUg
J290Z19zd2l0Y2hfc3VwcG9ydGVkJyBvcHRpb24gY2FuIG5vdyBiZSByZW1vdmVkIGFzCj4gaXQg
aXMgbm8gbG9uZ2VyIHJlcXVpcmVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IFJva29zb3Yg
PGRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGlu
Z2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
