Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41582CD11C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2024 04:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6x3J6o2S8AYGZ98lSfKr1TTnsGT+5jkUVjxQT0OJPJE=; b=NAoOaV0Xo1k8gi
	endUIUuPKeUvoBfUxKyeT+T2JdeCvDgYLL4k6Wx75mBT332fBvUMy1X0hPq/LRHTdjheaAfo0HynC
	XHSLd7egprH51DYHtlUymoiZ5b1RCrVqAEuQO6epFYl5S3xeK9UHw720rhFhjm/Uv254TNM/F0lmw
	zTZJSOjC+wlXJxrjMBCvpzqsy9lbpwzcNd2sgrERURaaFaZioMxwSLpLWanRl1Jpao59mD7n28k/g
	JJKlohIAI7oOzBS67shwTku7rBrkVQkMHdtnF4Ht1ZC6blmQ/R5+ANxP/X66PqkxXlLEHiATYXUge
	U3Eq7Z4hr2yHC6V/+N2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruPTz-00000004zus-2Di0;
	Wed, 10 Apr 2024 04:22:47 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruPTx-00000004ztp-03KX
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Apr 2024 04:22:46 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-34641b7c49aso717826f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Apr 2024 21:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712722961; x=1713327761; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50/EoYp4xiPcQjk7THZgfgs+ueFYqdmiSEQ2Y/A5NR4=;
        b=FS9QMmqewgUyMjyGGGREFhCBV+0CpXYrPxjY62WnR6NY39038PolFcKW4nxt0PbvIT
         bgyds/KExyYWhcuuDuhzTR5SGxsABBIKuy6OkwVz1kFr7vkslQpszuYMi6ducKRk4OrS
         lel3n/3NlAsaoQVqD4veGq1gCayTY4umdSoximM39RYQajUFrWORdEWnWKnjOaFqrEW1
         eV8HtHnBncvxevJ7JfwAVzsqhtxxKZQFjzh5z8MsEGFdhpOLGNcnucsaH1hwBND+CH5Z
         nZK4Nd+M/2fT1UE5ZNhypi9XizJbfkNmf+18fynLvOmi/LpJVsWw92i1uYwOry0TiuD8
         hetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712722961; x=1713327761;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50/EoYp4xiPcQjk7THZgfgs+ueFYqdmiSEQ2Y/A5NR4=;
        b=RhvnyYO6V8L5bARX2+uSBKnS1HmPMDEjPYsG8jzRS7ZQ1mx7amxV79cm9572iVmPd1
         eW5Nmar4aoFSN9tyiysb2o4hiUFHMZJqpEdjeLK8YqURJ4h76I8KPkeHAKZUvQLF2sQb
         OI3YbX6NTvv3eOUA23FlRBLaiKwslSh8K7rkC6Qhw4h2C70/UraShOgx5PPBKhEtADJp
         3a7Rx2wQ2fGbZmWOjzScWb1gmYRwlP0nzZFwJXck0iIhs/UKsBdqEM3GnhcO5fjDFc4m
         ZEn4o+Uc+uWFqh00/nCRuUQOuNNXuLcju04YKgGo3fYcOr9DS94Q9D44PNI4Wkn37M9Q
         jZ9g==
X-Forwarded-Encrypted: i=1; AJvYcCVYiPOeMKe2I3BcBmY8V0lawQHfJkOXTokutZVv2U+EPbqEpFPz8AgVNJxa0TP8gol9PK4FT7n6klUMxndZ1j00HhldmXjc/NW2ubgLalNrDl0=
X-Gm-Message-State: AOJu0YxzSvuI8lmCx5UH16rM1OSuRCi2DX0wL6zetHeI/RVFJ+9Ykk2m
	PupugYPToklLcjRrnMBRCCqwYncsTvXcRFmvaLk4U4D9GiZrHi6p
X-Google-Smtp-Source: AGHT+IHhKHEr3v3LDAgyhKHwIE9KipXbIkSHGprCwjFscoVbk1+9ZU+3a0NumbkHPHLpvO0f/FlwAg==
X-Received: by 2002:adf:fc4b:0:b0:343:7d3c:ddcd with SMTP id e11-20020adffc4b000000b003437d3cddcdmr964972wrs.1.1712722961051;
        Tue, 09 Apr 2024 21:22:41 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id p13-20020a5d638d000000b00343ad4bca7dsm12898554wru.85.2024.04.09.21.22.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2024 21:22:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 1/2] dt-bindings: panel-simple-dsi: add New Khadas TS050
 panel bindings
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20240409082641.359627-1-jacobe.zang@wesion.com>
Date: Wed, 10 Apr 2024 08:22:25 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 quic_jesszhan@quicinc.com,
 sam@ravnborg.org,
 nick@khadas.com,
 thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org,
 devicetree <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 AML <linux-amlogic@lists.infradead.org>
Message-Id: <3CCAF214-09FE-4580-99CD-AB95E78FFB8F@gmail.com>
References: <20240409082641.359627-1-jacobe.zang@wesion.com>
To: Jacobe Zang <jacobe.zang@wesion.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_212245_168997_2B81F734 
X-CRM114-Status: GOOD (  15.64  )
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

PiBPbiA5IEFwciAyMDI0LCBhdCAxMjoyNuKAr1BNLCBKYWNvYmUgWmFuZyA8amFjb2JlLnphbmdA
d2VzaW9uLmNvbT4gd3JvdGU6Cj4gCj4gVGhpcyBhZGQgdGhlIGJpbmRpbmdzIGZvciB0aGUgTmV3
IEtoYWRhcyBUUzA1MCAxMDgweDE5MjAgNSIgTENEIERTSSBwYW5lbAo+IGRlc2lnbmVkIHRvIHdv
cmsgd2l0aCB0aGUgS2hhZGFzIFZJTTMgYW5kIFZJTTNMIFNpbmdsZSBCb2FyZCBDb21wdXRlcnMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSmFjb2JlIFphbmcgPGphY29iZS56YW5nQHdlc2lvbi5jb20+
Cj4gLS0tCj4gLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1w
bGUtZHNpLnlhbWwgICAgIHwgMiArKwo+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sCj4gaW5kZXggZjkx
NjBkN2JhYzNjYS4uZTE5NDMwOWYzMWI3MiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUtZHNpLnlhbWwKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5l
bC1zaW1wbGUtZHNpLnlhbWwKPiBAQCAtMzYsNiArMzYsOCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAg
IC0gamRpLGZoZC1yNjM0NTIKPiAgICAgICAgICMgS2hhZGFzIFRTMDUwIDUiIDEwODB4MTkyMCBM
Q0QgcGFuZWwKPiAgICAgICAtIGtoYWRhcyx0czA1MAo+ICsgICAgICAgICMgS2hhZGFzIE5FVyBU
UzA1MCA1IiAxMDgweDE5MjAgTENEIHBhbmVsCj4gKyAgICAgIC0ga2hhZGFzLG5ld3RzMDUwCgpQ
cm9kdWN0cyBhcmUgb25seSBuZXcgdW50aWwgdGhleSBhcmUgb2xkLiBBdCBzb21lIGZ1dHVyZSBw
b2ludCB0aGVyZSB3aWxsCmluZXZpdGFibHkgYmUgYSB0aGlyZCBpdGVyYXRpb24gcmVxdWlyaW5n
IGEg4oCYbmV3IG5ld+KAmSBuYW1lLiBJTUhPIGl0IHdvdWxkCmJlIGJldHRlciB0byB1c2Ugc29t
ZXRoaW5nIGxpa2Uga2hhZGFzLHRzMDUwdjIuCgpDSC4KCj4gICAgICAgICAjIEtpbmdkaXNwbGF5
IEtEMDk3RDA0IDkuNyIgMTUzNngyMDQ4IFRGVCBMQ0QgcGFuZWwKPiAgICAgICAtIGtpbmdkaXNw
bGF5LGtkMDk3ZDA0Cj4gICAgICAgICAjIExHIEFDWDQ2N0FLTS03IDQuOTUiIDEwODDDlzE5MjAg
TENEIFBhbmVsCj4gLS0gCj4gMi4zNC4xCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
