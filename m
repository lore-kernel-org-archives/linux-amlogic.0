Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FB1C636CC
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Feb 2023 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCm55cvPR62MnbqgVhciDUGIqT67VMT6IRJq4N/3gQc=; b=IO8/L11wYhNAw+
	0TrODevSQPogG4j7bCcWJECe6vn5g85VuCw8XgBeeLEyT26hNVbjQtN9sX3hrLu1hB2viWXOcC6e7
	Av7ji/6LZsjEjMB+6hB1DkeHTFKY9Q4MeY3fp7Vd+XSgs8eyY3l3jDfb3RY1k8p9jJmr8BFNHN4W/
	vkZ7ts3z5d9lUlfrP4uzQT+RxwJ98ovOr41IWVK0uCLreKdYVfKjFLjp68xtmm9BF8i078XjPT6D3
	GJcMByIUl3jbWGI7uBS0FoSMQ6Ayhek4ozYPvCmZ3IH2+Xldr14hqKBQpp6CUvv7BTzfkX+VOPoHJ
	nQTKQ1jUhkZ35JZCrbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPjeO-00Fb7X-Hw; Wed, 08 Feb 2023 12:34:12 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPjeM-00Fb6T-5Q
	for linux-amlogic@lists.infradead.org; Wed, 08 Feb 2023 12:34:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so1358156wms.1
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Feb 2023 04:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NApcTHIL8LQ0WFUaSYDt91UR5S+St7BhBLbbOTErpU8=;
        b=Ld0qd1sczDVgvvMcWGAg1+5hW3DtHRwtFfDuo/NtFkb99aYYycA0cs7V+m/dPxK8f5
         fNjp3YJDPnlIUfF2f8+RjMyUq1/PxiDT7GxtNhdnEPdrPC3PRDLlrl8j1h/Dj373kpdM
         rWP2NJ9PNqxFeZw/UGq+EP8ynaS/e2Oh/x8soCBY2uyHS70M7zkVMF0+NIHUeX5j9dfr
         CxIb6V0iGxTUuiHVHNp+IL1m0AMQ/fnCg5PyY3DYMFXiYzjVf8dDXvuFNaF9eLl3K8mf
         UhzEwKlnwQV/96FwAcMGJYRdiBb1uEwIUSfTV+AaZ4EZijGsE+rG3aorAYTMLCiU5l6P
         xQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NApcTHIL8LQ0WFUaSYDt91UR5S+St7BhBLbbOTErpU8=;
        b=yxWNw93+hLaRX4vQ8ibYpw1VCF+bwCqBIY1JlEnRz+q8fw+2XvQkSm7oyEPF3FnQum
         G4SfHvbTYCVRXY8AWWskhI2HmO28GS1xfMctrxALbNy/hu/hbGxfvH//1PoVohHGmjoR
         U+VVg/Iy0V3ZmvylZ34TO5UaAW3fCln6bp4Jaexw3cfpXb6TaF2fRN0p9z38AO/qWaBC
         cxKeiKkDGjYnX3anoX1/d39tbcrQ+DJeI7A6OCJAO2cxwtq2at+sil/23IPtSI3T7er6
         zVRrnsmD8b794YAXQW9spDbDmd68R1MI+WC8kxdBslQ43XErSRHkeRJ2TrJzmngNWdru
         eHQw==
X-Gm-Message-State: AO0yUKXVAK73Si7m5LCWoIeeUpGWOGOxApkzPlM/Z9S5EuDLsJDEqgRa
	HRdZHuhRa3elfyQcH5PV9G7ZVQ==
X-Google-Smtp-Source: AK7set+rEc+7o8KwhGFhLxLZS4SoFRJ8ysU4c2vGcdF1tGsk+sAb9/VWFFxL88Vizq3VWuZ9Fmn0oA==
X-Received: by 2002:a05:600c:46c6:b0:3de:56a8:ae6b with SMTP id q6-20020a05600c46c600b003de56a8ae6bmr1609168wmo.34.1675859647305;
        Wed, 08 Feb 2023 04:34:07 -0800 (PST)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id j20-20020a05600c191400b003dd8feea827sm2103730wmq.4.2023.02.08.04.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 04:34:06 -0800 (PST)
Message-ID: <3a06d80c-7f52-2c5c-840e-09a0a08400f4@linaro.org>
Date: Wed, 8 Feb 2023 13:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/2] arm64: dts: meson-a1: add gpio_intc node
Content-Language: fr, en-GB
To: Alexey Romanov <avromanov@sberdevices.ru>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@sberdevices.ru
References: <20230202141520.40003-1-avromanov@sberdevices.ru>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230202141520.40003-1-avromanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_043410_270974_8CCE4A81 
X-CRM114-Status: GOOD (  11.48  )
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

TGUgMDIvMDIvMjAyMyDDoCAxNToxNSwgQWxleGV5IFJvbWFub3YgYSDDqWNyaXTCoDoKPiBBZGQg
Z3BpbyBpbnRlcnJ1cHQgY29udHJvbGxlciBub2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhl
eSBSb21hbm92IDxhdnJvbWFub3ZAc2JlcmRldmljZXMucnU+Cj4gLS0tCj4gICBhcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYTEuZHRzaSB8IDEwICsrKysrKysrKysKPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1hMS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLWExLmR0c2kKPiBpbmRleCA2MjY4YzMyM2E4MTAuLmEwNGRkZjBmNGNkMyAxMDA2
NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYTEuZHRzaQo+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1hMS5kdHNpCj4gQEAgLTE1OCw2
ICsxNTgsMTYgQEAgY2xrY19wbGw6IHBsbC1jbG9jay1jb250cm9sbGVyQDdjODAgewo+ICAgCQkJ
CQkgPCZjbGtjX3BlcmlwaHMgQ0xLSURfWFRBTF9ISUZJUExMPjsKPiAgIAkJCQljbG9jay1uYW1l
cyA9ICJ4dGFsX2ZpeHBsbCIsICJ4dGFsX2hpZmlwbGwiOwo+ICAgCQkJfTsKPiArCj4gKwkJCWdw
aW9faW50YzogaW50ZXJydXB0LWNvbnRyb2xsZXJAMDQ0MCB7Cj4gKwkJCQljb21wYXRpYmxlID0g
ImFtbG9naWMsbWVzb24tYTEtZ3Bpby1pbnRjIiwKPiArCQkJCQkgICAgICJhbWxvZ2ljLG1lc29u
LWdwaW8taW50YyI7Cj4gKwkJCQlyZWcgPSA8MHgwIDB4MDQ0MCAweDAgMHgxND47Cj4gKwkJCQlp
bnRlcnJ1cHQtY29udHJvbGxlcjsKPiArCQkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47Cj4gKwkJ
CQlhbWxvZ2ljLGNoYW5uZWwtaW50ZXJydXB0cyA9Cj4gKwkJCQkJPDQ5IDUwIDUxIDUyIDUzIDU0
IDU1IDU2PjsKPiArCQkJfTsKPiAgIAkJfTsKPiAgIAo+ICAgCQlnaWM6IGludGVycnVwdC1jb250
cm9sbGVyQGZmOTAxMDAwIHsKClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1z
dHJvbmdAbGluYXJvLm9yZz4KCgpJJ2xsIHRha2UgaXQgb25jZSB2Ni4zLXJjMSBpcyB0YWdnZWQu
CgoKVGhhbmtzLAoKTmVpbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
