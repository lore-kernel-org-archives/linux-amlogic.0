Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5A0E94615
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Feb 2026 22:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWbPgASAk5SDhus8eXN8Byr3F0zsP40KtYoLvYMihMU=; b=aWvEKpuY9dkIYp
	33u9a6QKIN1QmwVUMyH3v4k+vX94d7+Q0y2TJLr8IxH1S1CZY8CRaOjufYePm1/gS8WujEOXyIT0L
	AqcUKCb1c8Icu52/bOw3E4vh/BB6dF6UQsR2x42BPLXlnExCPoxOJoOxjT7IsVzXRDydAHwH20FMG
	M0jEsR8kMu9hXdIdQkl3HFRDEJzMqjpOMADXXqHcxSA+RoqrcH0XGYgMvbmKLLox1QAcECfBe+oZc
	6oFYzsK/ihBdjvb379f9jqTx5NN3SrpjJLishwvX/Zn4IKymhatXzDCWPPhiA5C4S02LK1CG6UJV9
	NeGHf4o/eOXTSOiTwTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZYY-0000000G5eh-33vZ;
	Mon, 09 Feb 2026 22:16:34 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZYV-0000000G5dt-3rFv
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Feb 2026 22:16:34 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a102494058so27347435ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Feb 2026 14:16:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770675391; cv=none;
        d=google.com; s=arc-20240605;
        b=blfXCRp6R84ZD/9wj32Rksxjh97IfBDk7FG4o9DFA7/4hCdLAVt/QjqWDcE8Ll+gya
         o3Za1qI8z0nKicif4XnAEVJmeIAeWrLAn/oqAeeN1ygbR5HAFtMfCrROg4D11PsDD924
         dxVPD2zOhgvxSDj1dIwoHcqag1IyS7lXHm6JI5ymUF9kExFSJKuZA5OLMrVqtRQmG2iO
         4L931EYzOQuLu57CgAa8ZAJbSkGAW2eHmbYbO6S/vOyDyDa/8OqT1Lz88cTCvxy3VBE4
         ukTOmWKgzpbCb/kvv3rmHbRtb/kyNuZ3yWq2YYZJR2oPS9HWeJJboHWf07MlzFdwYwJ8
         zLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rGfGaApf4Ln8F4Ava2/6rjzX04shlpUSCovpsO90S6Y=;
        fh=UdvCdsO6YiR2qRBew37G2UVZrREtp2j8CsW4eVXx2Vg=;
        b=AkHvFmVdCWYqM0a0KxZMWrl8KRZMzCdodK0smdKzY2jSQSY1RZiz4cNlBHtXewyTBi
         TQPP2q7XF0csZJ28pZcRbfPw2ZoCq9lljmrOt/H8+hDZ3X+L6Xlhe3mccCkHBUhrZ4GW
         V/gempzCyvjD8ZvPVfzooHklJdc7uj7FBg0WxCq0Tmxz4Sb3l1/JPKUHsxKaieOGO9Tv
         F+aRNYmZpN18whogsiuTqPWt5L0qlbO2iIzERocuWr7FdsbdMIqT/2tWZrtoVt3fVh29
         FnPQzetVq1z+K14rCz5ZV3a41S/eaaIps2xqe0ZmWFYMFf5kkn7p3X3ZwZnPx7WOQA5+
         IkSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1770675391; x=1771280191; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGfGaApf4Ln8F4Ava2/6rjzX04shlpUSCovpsO90S6Y=;
        b=R50yMI9bqHGillJ5vWNykSM/r1ehneIoMXrB7HkbTsp16yr2bQhGl9crWdFjp31zSk
         PpSVKtzvZxSVc2a4yYO5NgLiosdTAxrOF/eMF255zCktnan1jonr2w2Gi5OxMwquVOzE
         7hxcEr2TkoWnD+RxK0tpr1J1oIvQAIWkgBBglesZnUF+9nyPEF13m0if3Qncqa1iRjA3
         5o3njAiV5zvDOiswjWHyINYzV12bKnu1Ghqe2EYmMrluXEC9VtwwFTeVpHEGD6MO6bpJ
         erV2Smt20Cc9BXTIkjdSu4MBu4gTlMQHOburPkYo2BjGma7LHpkPD+oOd2YH6XEw2ulc
         sFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770675391; x=1771280191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rGfGaApf4Ln8F4Ava2/6rjzX04shlpUSCovpsO90S6Y=;
        b=k1WSM3BUBHrZgAaYy9vzlGZFJJsUEsZX0IfNelmnJmIYyzEO5PtTo63WDZFFuzAMKv
         tR7qDwMWtHfsNNZrPl2e1YLN/sJseqeyzCvtN62aBTt6IRRd3n2K1kzW4kq2WwR33oCL
         AgYRkwKqRbReI4U9MkaotY8RAkgS/LsYZuneyAoS7E7Zu6CJpltG1C7H3ARUZXjKBdrQ
         uUU7tSxuQZMPxsvN3DNwt6/FRzTuLY6ZyedjCssVeZ/3KHmBbRs6lHbHpXq17ljA7j7r
         HN97fn0mKqv2b/feO8lsZFVA6+UW7OHUk6/ivZbPOD8jpeeFoF05QOolWl44cJTSYp8J
         NInA==
X-Forwarded-Encrypted: i=1; AJvYcCURUMRjF4oouPMYmNXfViY6r94lACLSlMtjW+Kl2CnqjjsZD2kf8/6hZK4y2JXXuIRQC5u8DUyCidHfZEeI@lists.infradead.org
X-Gm-Message-State: AOJu0YyZjYWYYXP50KpmBK6MMDZAAQG9/M/QiWErWIk3mdDUYkayaxLC
	0ZiFHDYaeWey9+5cTp1dOqybL2xPO6SaFVhJuLSgSpVon6qUfHdF/PeWy3pMKKhGGVsDQc3rsip
	iYHuvnYCAwc7mr/3BLLAv3a+R4a0TezM=
X-Gm-Gg: AZuq6aKO9UWNKZL01QN8zvndIDPkqXJlwNg7bBRSDKDARv/WXmRF3Ah+tQKwIRF95g4
	pKp7B7Ut0i87VR3yk5jODQTHM7TzcRQo/kG/pSsYs6w28JVX+zbCfV2/0fRI3b58Xr6oJhfF4Py
	wHxHnPzid6L8RM/Mc5ATdhghJMb7YEEa1MIskqZTBbbyiArsn8I1tUg8svHifmnWTKntvSTc0XI
	RdhgfIpcSoAc4OlhqNJwZav0qCy2wqDqInH9SQxcFwQuvxwwggRhbkkT/zcsRw1TQYTtcFkQ18m
	kucGcMDe2MuVf2Wk2V80M0fOeGSt
X-Received: by 2002:a17:903:983:b0:2aa:d288:851e with SMTP id
 d9443c01a7336-2ab0fe2a8a0mr2557625ad.19.1770675390613; Mon, 09 Feb 2026
 14:16:30 -0800 (PST)
MIME-Version: 1.0
References: <20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com> <20260205-a9-baisc-dts-v1-2-1212b46f95a7@amlogic.com>
In-Reply-To: <20260205-a9-baisc-dts-v1-2-1212b46f95a7@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Feb 2026 23:16:19 +0100
X-Gm-Features: AZwV_Qh43dpkg6GHmPnCSKEhcU2fCrAkcN4Vfkjmxi9aGDpCASTd9MHa_ZnwnNs
Message-ID: <CAFBinCB6kgbzm7bWv-=LA_Y+zpB7DwjJ0dqiqxumwuUW97Ddvg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for A9
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_141631_988430_46EFFFC1 
X-CRM114-Status: UNSURE (   7.99  )
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

T24gVGh1LCBGZWIgNSwgMjAyNiBhdCA3OjA04oCvQU0gWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxh
eQo8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4K
PiBGcm9tOiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPgo+IEFtbG9n
aWMgQTkgU29DcyB1c2VzIHRoZSBzYW1lIFVBUlQgY29udHJvbGxlciBhcyBTNCBTb0NzLgo+IFRo
ZXJlIGlzIG5vIG5lZWQgZm9yIGFuIGV4dHJhIGNvbXBhdGlibGUgbGluZSBpbiB0aGUgZHJpdmVy
LAo+IGJ1dCBhZGQgQTkgY29tcGF0aWJsZSBsaW5lIGZvciBkb2N1bWVudGF0aW9uLgo+Cj4gU2ln
bmVkLW9mZi1ieTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+ClJldmll
d2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1h
aWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
