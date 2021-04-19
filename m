Return-Path: <SRS0=2Oki=JQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A824C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Apr 2021 14:33:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C039861245
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Apr 2021 14:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C039861245
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rEpV6JpmDg1PKEZXUSd80cEizGv6qRqNK36P5LDWp8k=; b=S5MbMN4aAT3q43
	Vqh+RdJYIRbdP3UFaOSrEFJSJsLoOO7YyDGbtEkXAXaQgN0ikgIWJSfDOW/+t6a/4ebHsbMkrynlD
	mZaLaV2zCCHiiwTCzx7FNEyX+7kZRoKgkbuGomh3gKKYCSFBwVE9B6UEGor171TGW7W70US+de8e3
	+tCkjKus+eGYkKrtw3yWaZ7GhuvPqUpdexaV/moTmoEBXWeJhCvS4Yja25oApSrpEoUPrPYEkPrnW
	ssNRyLx1Whm+myMgyhq4ha71licTQkVVxsn0tiawGMF1nuzXG6+y6PvhXNmkbjbbuNX2MczKCm14p
	s5obd88ehYlADngQSkkg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYUyB-00A7DN-Ui; Mon, 19 Apr 2021 14:33:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUy9-00A7D4-ND
 for linux-amlogic@desiato.infradead.org; Mon, 19 Apr 2021 14:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=oKZAehqJ4oAgTXaYrnAjdz/9vs3QBaSC/v5Wi00rjQY=; b=o7hCPWVbQbfrovR22YjsUYYkWa
 IcpkIx1QBCZzn2t/Nj15Sq6dNnB6V5RSrW/k2sNNyd9KPTifjSncEyjzpKVaxBAqqtnedTM8iQxtq
 h7AFd1piJLt1naoQX2kAAYWcnFFrOWRDLzCt0rltp3yCgrzn5fCfAeW9LiWnR/QUXpSnGUAKek9yJ
 0nNEAtUPgXxu4Ve4GCAzCurgsUbro5o3Hd0GBAJq/IP4J4pNY1d23KdOdMl34Ewjk4zJ2QEnajI3D
 xkwOIIEE9t4r8GDvVgwjo/WZxImX72Xvi/i6VAPkl+PjRPR2R0a8bak5rrdjrSj+xSm03T5hXwem3
 o022wXyQ==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUy6-00BSH9-PL
 for linux-amlogic@lists.infradead.org; Mon, 19 Apr 2021 14:33:44 +0000
Received: by mail-ed1-x531.google.com with SMTP id bx20so39848874edb.12
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Apr 2021 07:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=oKZAehqJ4oAgTXaYrnAjdz/9vs3QBaSC/v5Wi00rjQY=;
 b=a4aAfTXpmWCq7/xR9/53kW7ari2bmGi6wvp63W6JjnTW3XoH1xKiM5e6M+EUCXi0Lc
 gMeDuf//scl+Tln44hwnF2/f8/Rgx3VKoLbseKhI0cPavGQOdpTrlCf57b+hHQFKcOk5
 wmCcqor/5KcMjGvSL6U7g52zCNgpIBpuZAt0KRBt0CVyM12EF1NRpDDNYdCzgFBkJj2z
 +lPyV9ZhjoxVdy2tEN6H91R7SHNGvu4lQUfDlfzIvfZyiz91PsaheVj5fO8DOx8yv3MA
 /kvxaZZpmy0SEWtY241XEFXVjs2VJac2pvtgKaFt4XLaEvDUuxYDw4ENzRk0r1vCGECA
 kqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=oKZAehqJ4oAgTXaYrnAjdz/9vs3QBaSC/v5Wi00rjQY=;
 b=K0sum5r68n6a6U7T4t52lXZU8AgjBfVB4JAmZqASBpUhQyneW3N+BUyeAtN5cxNpgA
 DsrDpfXxXlSPrP3tp1gMeoD9ahJtJSsiUxu22c/YezCLZEZ6IyA0sHw4BmGLYaEOf/YV
 Lo/Yn+9lc7skDHZqokSwNg7TYNQxyO28UZ6wD0ze/DYikChQUqW/069/tqN0/tytcba4
 J/zD5yfgOymiM3wopN/mnxnq3lYvSME/TNOTg6aQnPNOVwJFEVV7soJT3usHCHVMwx6A
 51IsBJtYL5mm4MgQVlM4tVOv0HZFmkIhamVBtoamELlBEt7zdZIymnuUbV3npoiB0Iy5
 mqtA==
X-Gm-Message-State: AOAM532/AnOvw/z7D4vyiQqapaaZdh40obiATb7HVPy7QB0jCxcpCIEZ
 az9T7qpvF4tSv+xTbljuoxM31B4SaJ4=
X-Google-Smtp-Source: ABdhPJwxShnbjmCItEjd1W7Ev4y+gJluRa69/x5TG/XGGFY/Lq0DjgYz9X+pcKBlJ2pYyrYXFScZ1A==
X-Received: by 2002:a05:6402:1051:: with SMTP id
 e17mr26217520edu.42.1618842820446; 
 Mon, 19 Apr 2021 07:33:40 -0700 (PDT)
Received: from [192.168.178.24]
 (dslb-002-203-240-209.002.203.pools.vodafone-ip.de. [2.203.240.209])
 by smtp.gmail.com with ESMTPSA id yr16sm10491584ejb.63.2021.04.19.07.33.39
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 07:33:39 -0700 (PDT)
From: Mathias Steiger <mathias.steiger@googlemail.com>
X-Google-Original-From: Mathias Steiger <mathias.steiger@gmail.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH] fix green/pink color distortion from HDR set during vendor
 Uboot
Message-ID: <50fb92c7-28f2-f3c8-7986-425cdac77c78@gmail.com>
Date: Mon, 19 Apr 2021 16:33:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_073342_846677_2C5A53DB 
X-CRM114-Status: UNSURE (   9.31  )
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

CkkgYWxzbyB3cm90ZSBhIHByb2dyYW0gdG8gc2V0IHRoaXMgdmlhIC9kZXYvbWVtIGZyb20gdXNl
ciBzcGFjZTogCmh0dHBzOi8vZ2l0aHViLmNvbS9iYWxsZXJidXJnOTAwNS9hbmRyb2lkLXR2Ym94
LTItbGludXgtcGMtYW5kLXNlcnZlci9ibG9iL21haW4vZml4X2dyZWVucGluay5jIAouCgoKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMgCmIvZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX2Rydi5jCmluZGV4IDQ1M2Q4YjRjNS4uN2Q5MjliNWIyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX2Rydi5jCkBAIC0zMDgsNiArMzA4LDEwIEBAIHN0YXRpYyBpbnQg
bWVzb25fZHJ2X2JpbmRfbWFzdGVyKHN0cnVjdCBkZXZpY2UgCipkZXYsIGJvb2wgaGFzX2NvbXBv
bmVudHMpCiDCoMKgwqDCoMKgwqDCoCBkcm0tPm1vZGVfY29uZmlnLmZ1bmNzID0gJm1lc29uX21v
ZGVfY29uZmlnX2Z1bmNzOwogwqDCoMKgwqDCoMKgwqAgZHJtLT5tb2RlX2NvbmZpZy5oZWxwZXJf
cHJpdmF0ZSA9ICZtZXNvbl9tb2RlX2NvbmZpZ19oZWxwZXJzOwoKK8KgwqDCoMKgwqDCoCAvKiB1
bmRvIHNldHRpbmdzIG1hZGUgaW4gdmVuZG9yIFVib290ICovCisKK8KgwqDCoMKgwqDCoCB3cml0
ZWxfYml0c19yZWxheGVkKDE1IDw8IDEzLCAwLCBwcml2LT5pb19iYXNlICsgCl9SRUcoT1NEMV9I
RFIyX0NUUkwpKTsgLy8gZml4ZXMgZ3JlZW4vcGluayBjb2xvciBkaXN0b3J0aW9uIC0gCnJlZ19v
bmx5X21hdCBtdXN0IGJlIDAKKwogwqDCoMKgwqDCoMKgwqAgLyogSGFyZHdhcmUgSW5pdGlhbGl6
YXRpb24gKi8KCiDCoMKgwqDCoMKgwqDCoCBtZXNvbl92cHVfaW5pdChwcml2KTsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9yZWdpc3RlcnMuaCAKYi9kcml2ZXJzL2dw
dS9kcm0vbWVzb24vbWVzb25fcmVnaXN0ZXJzLmgKaW5kZXggNDQ2ZTc5NjFkLi45MTM1MWY5YTMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9yZWdpc3RlcnMuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcmVnaXN0ZXJzLmgKQEAgLTYzNCw2ICs2MzQs
OSBAQAogwqAjZGVmaW5lIFZQUF9XUkFQX09TRDNfTUFUUklYX1BSRV9PRkZTRVQyIDB4M2RiYwog
wqAjZGVmaW5lIFZQUF9XUkFQX09TRDNfTUFUUklYX0VOX0NUUkwgMHgzZGJkCgorLyogb3NkMSBI
RFIgKi8KKyNkZWZpbmUgT1NEMV9IRFIyX0NUUkwgMHgzOGEwCisKIMKgLyogb3NkMiBzY2FsZXIg
Ki8KIMKgI2RlZmluZSBPU0QyX1ZTQ19QSEFTRV9TVEVQIDB4M2QwMAogwqAjZGVmaW5lIE9TRDJf
VlNDX0lOSV9QSEFTRSAweDNkMDEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
