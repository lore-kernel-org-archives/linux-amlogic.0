Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4140C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Apr 2023 20:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=goy11oARw52+YtgPOY/EGUSOqBIAKoQwZS3sQpanvkk=; b=ZrDduETW1MT2+8
	KVH4SMOroTXSahYrHquzqgK9RjeOSaB1q3xNfcAb7jZale7ljZ5c7YEvvuI/5XN46E9OeBQ7P+YP5
	HSCO6mxH0q8KRu92O0eBXXjznJu9rzBppVSw6NBc71eoyCFgg3GsJJBl5Yz/gn5xtvvyl1tLLC9cm
	NSz2ddVtl9zNMoZkzJJ1yWM/cczZWzZv7wTvgw6CVq4frugd66qLj39L4i0lzcSB6WxmpfPfqHpQx
	KcTetk48koTuww2r8++HrukWWOC2Ls+T7Y+5MTF/SW570lCUquCRInwocz9mzwHuY+hcZ6njFRo+P
	NtVzmOsrsz8kb/icC1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pii17-00BHE6-2y;
	Sat, 01 Apr 2023 20:40:05 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pii14-00BHCt-00
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Apr 2023 20:40:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso15884016wmo.0
        for <linux-amlogic@lists.infradead.org>; Sat, 01 Apr 2023 13:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680381600;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54WZlKFOH7z5ow1TMELZBNq0Ok+OKChGqnAavsTIt50=;
        b=Zi6RFMmsqxCOCubKiabzmroMnsnSzzswgQogx2DJo7nlLLcHzNFfMrQddlDKYNaMMR
         yXrp55GZvc/XtcGNMVmYP/GCiTroSWzEhO+IHGFbz8hYP7MtBK/r+7Tgnq5UKC3Dyr0b
         yDlTqS7Yn2qu6zn5MUIi38OHjc+vjL3DLRs1XDoOu4koZ9hHgIbUHV6PaYHWkYwqgmE8
         z37ad18320vLGNnWT3G9cyrTp1zxRkDz7Zk6T2sc0ChlugqjtKV1NFAHB4d+ByC1FrGp
         fgwB7za1HTwoMHJ7abtg8Y8OwaRbXhqg4KxHnRjx8Z7ztY0WU7hmGC53nS4du9cIEEVL
         2fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680381600;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54WZlKFOH7z5ow1TMELZBNq0Ok+OKChGqnAavsTIt50=;
        b=rydfg8+ZIpiC/q8G+K4JtznTgR1IJhPJsM4IY+/zuZq0JelteOh3bs35G3IaOScsqZ
         c+O/75PNKJIxP4p/Wm5EgHW9sEhUZ4JdPOKN7sbR6cuVeTlGtolf2DS8vPNLutrntQWI
         v6pTy9HtSYyJsviPRbY++HNrewsb490fSgShVEEwVYAV2fUvZ3TJE1dCEcpcrfY1DS9q
         UUDcCA5DqoT42SZq1mxQqLIEF/9Qy66eCEpwCC6FZpeoJFDUXrcXUZtNYyaOJ4aF7fCK
         pieCJCAolDkPApgwws3UzfKa+qKKZQzGsM2grsgavLcFLwBKurh+cJYywKElHgWsv2DO
         abtQ==
X-Gm-Message-State: AAQBX9f6KrXvbHKhzzpgX/dnkuO6CEAI7bCaVIDgLxP++WDjC25pLslc
	izBxaTXvv1v4k9i4FlxaNEI1kg==
X-Google-Smtp-Source: AKy350agutLAusoP7ESlN2zNEl/9Hx3qYZ9lnD2QfxKiwZHrGUaPAddBOpSu0Jn/T9RctFKUwc2U6A==
X-Received: by 2002:a1c:f207:0:b0:3f0:4f83:22f4 with SMTP id s7-20020a1cf207000000b003f04f8322f4mr83242wmc.20.1680381599641;
        Sat, 01 Apr 2023 13:39:59 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b36a:1186:309c:1f9a? ([2a05:6e02:1041:c10:b36a:1186:309c:1f9a])
        by smtp.googlemail.com with ESMTPSA id m9-20020a7bcb89000000b003ed4f6c6234sm7078132wmi.23.2023.04.01.13.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 13:39:59 -0700 (PDT)
Message-ID: <93922fdb-331a-15bb-514a-2015e65ee4c3@linaro.org>
Date: Sat, 1 Apr 2023 22:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] thermal: amlogic: Use dev_err_probe()
Content-Language: en-US
To: ye.xingchen@zte.com.cn, glaroque@baylibre.com
Cc: rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <202303241020110014476@zte.com.cn>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <202303241020110014476@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_134002_379218_36FEA229 
X-CRM114-Status: UNSURE (   7.17  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjQvMDMvMjAyMyAwMzoyMCwgeWUueGluZ2NoZW5AenRlLmNvbS5jbiB3cm90ZToKPiBGcm9t
OiBZZSBYaW5nY2hlbiA8eWUueGluZ2NoZW5AenRlLmNvbS5jbj4KPiAKPiBSZXBsYWNlIHRoZSBv
cGVuLWNvZGUgd2l0aCBkZXZfZXJyX3Byb2JlKCkgdG8gc2ltcGxpZnkgdGhlIGNvZGUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogWWUgWGluZ2NoZW4gPHllLnhpbmdjaGVuQHp0ZS5jb20uY24+Cj4gLS0t
CgpBcHBsaWVkLCB0aGFua3MKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAg
PGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDov
L3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5v
cmcvbGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
