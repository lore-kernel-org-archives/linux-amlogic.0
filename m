Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971CBC7EE2E
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jun 2023 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVheeStdEuq4IsC1LxpxJ/tUdC22s+KifT8a3BGEkys=; b=OjCUrF8O0E8xQL
	LnnSgVFTvSv3mwCBjcZq43lbZPd0KFac+5fR1OkINeVfb2hqDmNjBgvrkZdS7IwaPtM513FanBG/B
	DcGp+VkYmpVKYanh0BDNP2vc87DnYafxkxhTrEMrUdp9aRdBoKkU+VGnGGYE7M5DMGkcHr3vaFLpL
	1ITD6V/FjbDvo/azm67j7crA8fM0t7wa9v2ZZZIvbifoHHTedTT4GYegpAmYVdOzu07N6kjgRSUJV
	YM/lACsQpeYRQ2so4U3njyI7Z+rT7Z2J5WvGUlUODAyNIFDIn43IvzgdU8tHrb6aB6hISWAyn6dPL
	ajeJ+66goVRoP9QmnrMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q917R-007dMr-0c;
	Tue, 13 Jun 2023 10:19:21 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q917O-007dKX-0N
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jun 2023 10:19:19 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f644dffd71so6577043e87.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jun 2023 03:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686651554; x=1689243554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gdr35NVvZt5grZEtwTcOPCBT+aQqpwrBlFz/EyaAZAY=;
        b=MT0jfmQ3GaGeOaRdULj4v+tzEv/qyqc7kkboNHxFk95UTYxahYr1Wu/ReM1jUPq7Y7
         5PnBXZMc96XvR2x5cF5Mo4g9VQzuxuve1smXA/x1s28HNaT0qoVmHkCdJF7zlce98Yah
         Vaz6sEnoempjBHWeWrMDdGTGYwd16RzI8vGSIoX30PXPM8N1PCsjDICvwfsV33xxQ+bM
         3PnDWmo4w56mPiOZQCh1PHZLXr662z+H0LyPnJ7YST9C+8Z8gHzx5BPW6C5bxnqP8edq
         V+sYD+GUUs+oixU+TF6PE9SL7pob/GuO+3XieGjKuBrvD4M3luTpfPbY6LVciutjW5jy
         DfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686651554; x=1689243554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gdr35NVvZt5grZEtwTcOPCBT+aQqpwrBlFz/EyaAZAY=;
        b=ScEPPUKLZiaMOZF/eOFAg7aXu0TP2/QhF661VRvDSGpcuQquY/HHUxj0ahJuWS3Bmi
         HP/+AgSNrKyKA6MJnxv49DnsjZxMQCkmo3rAgWzeNN9YMLF/csp41IghGMhfbI1RwVnS
         TDk94RDNG/3SnxaEe10Q3njEtV2m/rM8pQrofohr6fIo7sQzs5Z7qwYq/VJu9Pg3QdJA
         RV62Y476cTXhlTeiJvz2X3KKb2wfo9x1oW7RIGe83xGAk3el1sa8YYQU5aUhmD0fSPRP
         45XLFFETlcrQ50n6qzFqPViJ0hG9lPBOMmzLI9/tsuWw8fVwd3WsWwtIqjgthdzngCAV
         Z+3A==
X-Gm-Message-State: AC+VfDyxYeT5j+y2bpskXUzwLSy+6igG1KhDRVOkQQ6LGS/tsmVDlolg
	tZuwAQRyh7VI39mcmfxSNJCZGw==
X-Google-Smtp-Source: ACHHUZ6PKN8jwmaGHls2F2gl2akc40go/8ljLq7Qwlu5jF0CTKmMviLXMRWLeIbs9+JRw390KY37Rg==
X-Received: by 2002:ac2:5b9a:0:b0:4f3:9136:9cd0 with SMTP id o26-20020ac25b9a000000b004f391369cd0mr5734769lfn.44.1686651553968;
        Tue, 13 Jun 2023 03:19:13 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:d6bf:b78b:2fff:653a? ([2a05:6e02:1041:c10:d6bf:b78b:2fff:653a])
        by smtp.googlemail.com with ESMTPSA id n6-20020a7bcbc6000000b003f6f6a6e769sm13838413wmi.17.2023.06.13.03.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 03:19:13 -0700 (PDT)
Message-ID: <16e72927-b3b0-7191-e05c-74acb5a77859@linaro.org>
Date: Tue, 13 Jun 2023 12:19:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND 1/9] thermal/hwmon: Add error information printing for
 devm_thermal_add_hwmon_sysfs()
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, glaroque@baylibre.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, thara.gopinath@gmail.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, anarsoul@gmail.com,
 tiny.windzz@gmail.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 edubezval@gmail.com, j-keerthy@ti.com, f.fainelli@gmail.com
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
References: <20230613095624.78789-1-frank.li@vivo.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230613095624.78789-1-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_031918_226682_BC1046B5 
X-CRM114-Status: GOOD (  18.00  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTMvMDYvMjAyMyAxMTo1NiwgWWFuZ3RhbyBMaSB3cm90ZToKPiBFbnN1cmUgdGhhdCBhbGwg
ZXJyb3IgaGFuZGxpbmcgYnJhbmNoZXMgcHJpbnQgZXJyb3IgaW5mb3JtYXRpb24uIEluIHRoaXMK
PiB3YXksIHdoZW4gdGhpcyBmdW5jdGlvbiBmYWlscywgdGhlIHVwcGVyLWxheWVyIGZ1bmN0aW9u
cyBjYW4gZGlyZWN0bHkKPiByZXR1cm4gYW4gZXJyb3IgY29kZSB3aXRob3V0IG1pc3NpbmcgZGVi
dWdnaW5nIGluZm9ybWF0aW9uLiBPdGhlcndpc2UsCj4gdGhlIGVycm9yIG1lc3NhZ2Ugd2lsbCBi
ZSBwcmludGVkIHJlZHVuZGFudGx5IG9yIG1pc3NpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogWWFu
Z3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4gLS0tCj4gUmVzZW5kIHBhdGNoc2V0IHNvIHRo
YXQgdGhlIGNoYW5nZXMgdG8gdGhlcm1hbC9od21vbi5jIGFyZSBjb3BpZWQgdG8gZXZlcnlvbmUu
Cj4gICBkcml2ZXJzL3RoZXJtYWwvdGhlcm1hbF9od21vbi5jIHwgNSArKysrLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3RoZXJtYWwvdGhlcm1hbF9od21vbi5jIGIvZHJpdmVycy90aGVybWFsL3RoZXJt
YWxfaHdtb24uYwo+IGluZGV4IGZiZTU1NTA5ZTMwNy4uYTU4MGFkZDVhMmY2IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvdGhlcm1hbC90aGVybWFsX2h3bW9uLmMKPiArKysgYi9kcml2ZXJzL3RoZXJt
YWwvdGhlcm1hbF9od21vbi5jCj4gQEAgLTI3MSwxMSArMjcxLDE0IEBAIGludCBkZXZtX3RoZXJt
YWxfYWRkX2h3bW9uX3N5c2ZzKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHRoZXJtYWxfem9u
ZV9kZXZpY2UKPiAgIAo+ICAgCXB0ciA9IGRldnJlc19hbGxvYyhkZXZtX3RoZXJtYWxfaHdtb25f
cmVsZWFzZSwgc2l6ZW9mKCpwdHIpLAo+ICAgCQkJICAgR0ZQX0tFUk5FTCk7Cj4gLQlpZiAoIXB0
cikKPiArCWlmICghcHRyKSB7Cj4gKwkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gYWxsb2NhdGUg
ZGV2aWNlIHJlc291cmNlIGRhdGFcbiIpOwo+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiArCX0KCldo
ZW4gYW4gYWxsb2NhdGlvbiBmYWlscywgdGhlcmUgaXMgYSBjYWxsc3RhY2sgc2hvd2VkLiBJdCBp
cyBub3QgCm5lY2Vzc2FyeSB0byBwcmludCBhbiBlcnJvciBpbiB0aGlzIGNhc2UuCgo+ICAgCj4g
ICAJcmV0ID0gdGhlcm1hbF9hZGRfaHdtb25fc3lzZnModHopOwo+ICAgCWlmIChyZXQpIHsKPiAr
CQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhZGQgaHdtb24gc3lzZnMgYXR0cmlidXRlc1xuIik7
Cj4gICAJCWRldnJlc19mcmVlKHB0cik7Cj4gICAJCXJldHVybiByZXQ7Cj4gICAJfQoKVGhhdCBz
aG91bGQgbm90IGRpc3BsYXkgYW4gZXJyb3IuIFRoZSBjYWxsIHNpdGUgd2lsbCB0YWtlIGNhcmUg
b2YgdGhhdC4KCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93
d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIu
Y29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJv
LWJsb2cvPiBCbG9nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
