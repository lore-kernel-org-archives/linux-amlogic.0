Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763C7C27C53
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2024 06:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WO+haPZYfdv48NL89SWEvlhmCS/ISfPdLYnU3TdROmQ=; b=4EuGf3UsIWQl+V
	/wZEZz92mruN5dRZt9EeweuQ5+nCAlT1d1tmZM9VebeMMK3Als1OpLmbA0+iBAeW0icha+3Q8McfF
	QzbZZx8JDPSpAdg4p4MBsr4QI/hD+wACrJPU9m4YXkU4yI/WAcVPJ47EBdDe4pyJIMXYWMPMGCGTj
	jKcNOkqrQgowxtcCf1V84Jvbap2GeDRjw4HjZkZkFSy2PLchDqifOxXd0LWeRa+1asj145D4ETNQE
	rBuRg89M5n5kbvyi6uhrxOQjgd1TBU3t18hXXzSVBgVHoYNgZIeWTn+OK0e0NOb6dVLTPtxbpGxoA
	1RGV7WSGPuiW3dsh/2JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSkN-0000000CcF4-0Nee;
	Fri, 07 Jun 2024 06:06:43 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSkH-0000000CcET-3Ww6;
	Fri, 07 Jun 2024 06:06:40 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-354b722fe81so1765491f8f.3;
        Thu, 06 Jun 2024 23:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717740395; x=1718345195; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNZkxBEs7U5TdwARCjZjVhwqyxR/ZXTvzrddGfOudKA=;
        b=HrrpwLU8tYz7W1FH+xQ/PjroSNgQe9qmHZshlAeUT4Tx8tvuVRaoajfImnDSAB45S8
         0QxgRxOxhzg4xYCb0ZWMnhzrWsTDShrDiac8a/9IEJCFyqBFD6U4OhhvmeSboDf48bm9
         bUFx0Lxux/Uk6XJ6ldsP5VyNw+KcNnXE07qOxVBCZf+GcvRXbXqoHaTnr8LMCJYI/D6U
         lLNcNiBxMD5ec9TRR/worhG2+sPa/Aat9b+Yj8gd3r42VpsaiQ9P0ln9hZxHp/7d/aHe
         51/xVXOxfvXdfPFYXAiZic/If0+GBYtpMARqsQ1iwV9aZX2QP90jS3N+4P5URQBdHM9y
         mhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717740395; x=1718345195;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNZkxBEs7U5TdwARCjZjVhwqyxR/ZXTvzrddGfOudKA=;
        b=oZDEvuLTT+RTlUWOaRglavvC8PSR362rsfo7vG2lLw7nXEzUVG/iLUCofUU/xinPH/
         L5yaiIck591BLLBg6y42QY3Xuxna5+mlXhTxhoz7CKM/ouX7Mhoo3iumnkrVfE3bkUBa
         07qjkSqzgKJ0Awh5RARyEB5tGuwmQk8vbLRbxtbbOPLghyHnpIGJlZOvO+Cm4VQd0vuV
         0yRZWRg5uqyc7fr/2X6PRthgw7OW5GpJZTdKm4UUY4U5UcN53jGX0awULTikVG51RfAe
         6BEvX1+PuToiPclXA/XRqcxNQ/4h1jf/mUZ0pvdSNVO1Mj8YPY4VUpsOIfHRoovC+efK
         2EHA==
X-Forwarded-Encrypted: i=1; AJvYcCV+aT2LU3BQmVuVmY0tZFBwwiqFZansMcGmWO5DyWIuilNl9e4pptFRDUSuZFW+tfMjkmv+gjMauQvcEzM5BWrlJbJcSTL5Wdy/h3Y29wO27UFW2458yIdESIbCQYwfaY7EZ+1eVMirSzye7CcNfO3mkF5UPrKsWw==
X-Gm-Message-State: AOJu0YzgqefcVMhTdUAzYNxTA6RVNRZdL392/gzxwRNQS2xBVnamSX+o
	09vjTtR13iNXXjsPVoKOXd6/r6KJNiD2lpx0eNxg0JS7abJqxe7R
X-Google-Smtp-Source: AGHT+IEgwZKufWc5FwUuSbx7D4i1LN7jDSiJEogiwEw6n1p0cNIWxHRj+ziKiW0p1rfT+aXoS165cg==
X-Received: by 2002:a5d:45c9:0:b0:34f:f540:bdbc with SMTP id ffacd0b85a97d-35efed64bdamr1061157f8f.38.1717740394602;
        Thu, 06 Jun 2024 23:06:34 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d69867sm3230511f8f.57.2024.06.06.23.06.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2024 23:06:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH 00/12] arm64: meson: bunch of DT fixes, take 4 (final one
 ??)
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
Date: Fri, 7 Jun 2024 10:06:20 +0400
Cc: Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AML <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Message-Id: <34243887-1D78-4D1E-BBB9-607297813CC7@gmail.com>
References: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_230637_904463_971AC89D 
X-CRM114-Status: UNSURE (   9.55  )
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

PiBPbiA2IEp1biAyMDI0LCBhdCAxMjo0OOKAr1BNLCBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1z
dHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4gCj4gQWxvbmcgd2l0aCB0aGUgZm9sbG93aW5nOgo+
IC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNDIyLXQ3LXJlc2V0LXYyLTEtY2I4
MjI3MWQzMjk2QGFtbG9naWMuY29tLwo+IC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjQwNTEzMjI0NTUyLjgwMDE1My0xLWphbi5kYWtpbmV2aWNoQHNhbHV0ZWRldmljZXMuY29tLwo+
IC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNjA1LXRvcGljLWFtbG9naWMtdXBz
dHJlYW0tYmluZGluZ3MtZml4ZXMtcG93ZXItZG9tYWlucy1zcGlmYy12MS0xLTM4MGYyOWJhNGEx
NkBsaW5hcm8ub3JnLwo+IC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNjA1LXRv
cGljLWFtbG9naWMtdXBzdHJlYW0tYmluZGluZ3MtY29udmVydC1zcGRpZi1yZWNlaXZlci12MS0x
LTI2MjQ2NWFkYmFjMkBsaW5hcm8ub3JnLwo+IC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjQwNjA1LXRvcGljLWFtbG9naWMtdXBzdHJlYW0tYmluZGluZ3MtZml4ZXMtcG93ZXItZG9t
YWlucy1tbWMtdjEtMS00YWNiYjhjYzI2MjZAbGluYXJvLm9yZy8KPiAtIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDI0MDYwNS10b3BpYy1hbWxvZ2ljLXVwc3RyZWFtLWJpbmRpbmdzLWZp
eGVzLXBvd2VyLWRvbWFpbnMtbnZtZW0tdjEtMS1lZjZmMTBjODZhNjNAbGluYXJvLm9yZy8KPiAt
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDYwNS10b3BpYy1hbWxvZ2ljLXVwc3Ry
ZWFtLWJpbmRpbmdzLWZpeGVzLXBvd2VyLWRvbWFpbnMtcGh5LXYxLTEtYzgxOWIwZWNkOGM4QGxp
bmFyby5vcmcvCj4gLSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA2MDUtdG9waWMt
YW1sb2dpYy11cHN0cmVhbS1iaW5kaW5ncy1maXhlcy1wb3dlci1kb21haW5zLXJuZy12MS0xLTBh
NTVhN2JhNTVlNEBsaW5hcm8ub3JnLwo+IC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjQwNjA1LXRvcGljLWFtbG9naWMtdXBzdHJlYW0tYmluZGluZ3MtZml4ZXMtYXVkaW8td2lkZ2V0
cy12MS0xLTY1YmQ3Y2MyZTA5YkBsaW5hcm8ub3JnLwo+IC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjQwNjA1LXRvcGljLWFtbG9naWMtdXBzdHJlYW0tYmluZGluZ3MtZml4ZXMtcG93
ZXItZG9tYWlucy1zYXJkYWMtdjEtMS00MGE4ZGU2YmFhNTlAbGluYXJvLm9yZy8KPiAtIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDYwNi10b3BpYy1hbWxvZ2ljLXVwc3RyZWFtLWJp
bmRpbmdzLWNvbnZlcnQtZzEyYS10b2hkbWl0eC12Mi0xLTcwZDQ0ZmEzMDc5MEBsaW5hcm8ub3Jn
Lwo+IAo+IHRoaXMgYnVuY2ggb2YgY2hhbmdlcyBmaXhlcyA5OSUgb2YgdGhlIHJlbWFpbmluZyBk
dHMgY2hlY2sgZXJyb3JzLgo+IAo+IFRoZSB0d28gcmVtYWluaW5nIGJpbmRpbmdzIGNvbnZlcnNp
b25zIGZvciBhcm02NC9hbWxvZ2ljIGFyZToKPiAtIHRpLHRhczU3MDcKPiAtIGV2ZXJlc3QsZXM3
MjQxCj4gCj4gSSdtIHRvbyBsYXp5IHRvIGRvIHRoZW0gcmlnaHQgbm93LCBzbyBpZiBzb21lb25l
IGlzIGludGVyZXN0ZWQKPiBpbiBkb2luZyB0aGUgY29udmVyc2lvbiwgcGxlYXNlIGRvIGl0IQo+
IAo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8u
b3JnPgoKRm9yIHRoZSBzZXJpZXMsIHRlc3RlZCB3aXRoIG11bHRpcGxlIOKAmG1lc29u4oCZIGJv
YXJkcyAoR1hCQi9HWEwvR1hNL0cxMkIpOgoKVGVzdGVkLWJ5OiBDaHJpc3RpYW4gSGV3aXR0IDxj
aHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
