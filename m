Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF28C369D1
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Apr 2025 21:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROSIthQawFLWYfzOVYNMT9woCVxWdTCrIbkE2+u4oxk=; b=mEsABYxot/LJVq
	X3GyKwW9BkxyOm3DKubnDgWd/tQ306TeePrtGlT3yF1+qcElVOmLt1XsXxFbbf0zyRCRywmAeiSwr
	vCHgz+8Rd/8Awel6C0aYgbuYI7+EcpF2LBT6VqiNA/HkZ2EnoBIs3wgfschTNgPC931xcArRnQk/n
	wL0whnm7u3d/mYn+172cI4lsJ2X1YGqjf/myVXLw00Nmd/USaSTVfK5ZGxGN26NpAEhX8+MFu+cWz
	iqDFYfIBhl1kVx4tNRHyV4XcBPyEp0xegEgUnYoE5p9U0cvkTtcysW7BwNjFahJISmIDakmVa7brl
	4eRFYILFODf4/Jt9cIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u99Gz-000000040X4-2m73;
	Sun, 27 Apr 2025 21:10:49 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u99F2-000000040Q0-1NBh;
	Sun, 27 Apr 2025 21:08:49 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-227a8cdd241so56752055ad.3;
        Sun, 27 Apr 2025 14:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745788127; x=1746392927; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irNnhpUPyAbG1p4UJfyash5hUpMHlzekZFDQuw5FsnE=;
        b=j8x1/nuh3SdJad/WpK6y6aRPf+utAoThdc6acOQWJfqmMgAsd5Xtn+qYQ52b2cBKbc
         GasRKjxN3aR9KWPDX+pmqfkgK9lDQRCbq6NdYD2RI1zO9pfERZMt95AK1Lsxt3X95duF
         kBs7qsDyUW6bLPwTRVhnHaxaBWZzSAg8nwm81+PaB0fiQ99Mrs+O7B+7w4X4ubXG8BBe
         dh2MsEa48R4VAPxw7s06oOxRtehBSQDogcyL7Pk2EkJ/RmYcFLeHlhSLnXGVBB4LiCn9
         crllqIopFRz5nxRXCPu4QrRixJAg4vH/iEw7dPMVywwelbMV+rHXujL8mCkmZFkygCnL
         yX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745788127; x=1746392927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irNnhpUPyAbG1p4UJfyash5hUpMHlzekZFDQuw5FsnE=;
        b=fLkzbN3lK0xJsYsEsyRwpCEIHAvw52czSzsEBG392uN+3eI28vjWQHXrbca2GCFdzb
         9E7VtWK8PpgVqhDl8zuM1AizdOPz4T80plVw/ezwwKer1+YgnXobe62f74QtdRZ6mjxG
         JfLYuylusipNdVMMrwA2UsQ3xrmw1sCNe39wvW44vCECPfsQMN7mVmb5Y8dMpiHafTBq
         s5XG7KjTnUmxcyKgfdd8/u+4XSum99m/sGpoN0DVdnIgZesqANcYM3P1McMLWOwAcjtV
         V5JwDnhw6cB2ByiqlMnRuA++ut20IW97qB0N/RdqFIRX44RXSLM2WrjF+2x7OiD31Gpx
         LceA==
X-Forwarded-Encrypted: i=1; AJvYcCVBGWlcYgj/IFo4JZ7hkeP1v9JGdCOkhREM3WjzGbZF6M9nl2aLqhz1n93ejpltqIfluB5rdDVW+IfFkypNt8zWEQ==@lists.infradead.org, AJvYcCXWkmH128tfyowefFsQ+PM+CVRNnDuUpeW7DzYEblwHpqT3cqUhdZERI/v0Q0K261xpwZI+e9Jw41ZepEOU@lists.infradead.org
X-Gm-Message-State: AOJu0YwROGdrqwqqhaV6UkS+9OCC4sKqyp0os6Jf6763C6Dci09I9jto
	4sBZhH+ZyMSKEZmaAgTYX+8JNBFVu6KT190fT3oJOb35YiqwHXoLhxsef4vgximb85yPzwELE19
	Ut1by6155ZDohCZWfE/TjtGDUbs1cDlK7
X-Gm-Gg: ASbGncvyIqRA4yhv/arTfoj706dRFlYdlYgCi2iObQtrurkXDVnqEQoU6nQ7KaHjn/C
	o9vpAI1WITZn4Lbh1ysx3V7MHgbbRXrBKb5Ubvj1J2KB6rIWcz0o473DpwSaF3C1JGOJDPFsGCC
	qQnhtoTlAo3HCmjjISJZXJdYumhBWBdxhhQmCO
X-Google-Smtp-Source: AGHT+IGocl2yWOvr1gre0imG54JUGmymGatHDiDz76Em4CMmar3dxa70AKrZPaM7gcVEnNhp2xdwjHK7XXGAPUa+e2E=
X-Received: by 2002:a17:903:1986:b0:224:1074:63a0 with SMTP id
 d9443c01a7336-22dbf6218c2mr150456335ad.34.1745788126873; Sun, 27 Apr 2025
 14:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250425203118.1444481-1-da@libre.computer>
In-Reply-To: <20250425203118.1444481-1-da@libre.computer>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 27 Apr 2025 23:08:36 +0200
X-Gm-Features: ATxdqUH4ngC-BX3cBpEPOaM7UIKT2zGBTpdyLjm5NqfvqkKNl138-a_D7ZyE064
Message-ID: <CAFBinCCUQizs=XWq7knm-4=3=hzPDNee9RZj9LDD2Mi6DHYBrQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: Da Xue <da@libre.computer>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_140848_407138_2E062FD0 
X-CRM114-Status: UNSURE (   8.82  )
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

T24gRnJpLCBBcHIgMjUsIDIwMjUgYXQgMTA6MzHigK9QTSBEYSBYdWUgPGRhQGxpYnJlLmNvbXB1
dGVyPiB3cm90ZToKPgo+IEdYTCBJMkMgcGlucyBuZWVkIGludGVybmFsIHB1bGwtdXAgZW5hYmxl
ZCB0byBvcGVyYXRlIGlmIHRoZXJlCj4gaXMgbm8gZXh0ZXJuYWwgcmVzaXN0b3IuIFRoZSBwdWxs
LXVwIGlzIDYwa29obXMgcGVyIHRoZSBkYXRhc2hlZXQuCj4KPiBXZSBzaG91bGQgc2V0IHRoZSBi
aWFzIHdoZW4gaTJjIHBpbm11eCBpcyBlbmFibGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGEgWHVl
IDxkYUBsaWJyZS5jb21wdXRlcj4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgorWGlhbndlaSBaaGFvICh3aG8gaGFz
IHJlY2VudGx5IHVwc3RyZWFtZWQgQW1sb2dpYyBBNCBwaW5jdHJsIHN1cHBvcnQpLgpJIHN1c3Bl
Y3Qgd2UgbmVlZCBhIHNpbWlsYXIgY2hhbmdlIGZvciBhbGwgb3RoZXIgKE1lc29uOCwgTWVzb244
YiwKR1hCQiwgRzEyQSwgLi4uKSBTb0NzIGFzIHdlbGwuCkNhbiB5b3UgY29uZmlybSB0aGlzPyBB
bmQgaWYgbm90LCB3aHkgZG9lcyBvbmx5IEdYTCBuZWVkIHRoaXMgc3BlY2lhbCB0cmVhdG1lbnQ/
CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
