Return-Path: <SRS0=rXaj=A2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B5DC433EB
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 15:08:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32A9420658
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 15:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NlI1zso8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ic4mFINw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32A9420658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DiWVIoMTXEJzAPwVmJGBBwCvhh/F0Z5oqr1xYKdqGvk=; b=NlI1zso8DXMzqtTqWbCOp+PHR
	/dbCGCJdCMdXa0A5GRHZsZNYLJQMAJkkenPMadupUGvk0GUMjvWaAgPG6N3A5Q086Z6P8tviOH7Gx
	d/VcKPsCWbUTcICnKuNveWzkwSWyyPRz3Ecxu7IOtPc8SeujmRBKLOuVIlbo8DxGQbTgWS0izn1Tp
	SYLYyWFFNxWKN68vyxKld71IOXlpw+hY9j4ykYeTBswqcgBpbGnQAHrG6YleDelW5OLOBclKqs+E8
	IiumF5eyh071sTKT6Sa6SRY0wtszBwXAhxPJcSUOiAB9bhE1DsYq9wFg8WvCChcd1JAHNigp87OpK
	SfX0Slctw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvj0l-0006xD-An; Wed, 15 Jul 2020 15:07:55 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvizb-0006U9-3Q
 for linux-amlogic@lists.infradead.org; Wed, 15 Jul 2020 15:06:47 +0000
Received: by mail-wm1-x344.google.com with SMTP id w3so6163583wmi.4
 for <linux-amlogic@lists.infradead.org>; Wed, 15 Jul 2020 08:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Neuk7hlxyMHOEJZl+c3Ce+fuWuJ+zLYxzzvecm8U2ZQ=;
 b=ic4mFINwL49QSVPf3k9/rgWYim5/9jEoZkN3gqetr4K9fAHlJVyJ3XypL6SuWfRqDz
 +S7WszcHEof6BWrZKfFj9g/YLF71Qcm1yt4zHcQPPYgdqTAQxCrOZh51+TZvW0YQ8Ck0
 aLn5KjCQKZ3Gd/aFzV5L2DQfyiqU8ujb9Iv4xSapyMw6tqW4tt5JwZPpcrPnOA8PiwaE
 0yOlSql13qvWzpkdNz/tyd6HeetzNbv+eay/5/xjytCtAkIYMyDbb9Uefd2mAG3NGm2+
 EaVE9UW+LkFfgx1Zg5Rp6RueZCf8/5881/TkICwUazyXDTk14I4cs6dLDvr0xHFNjtcl
 EisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Neuk7hlxyMHOEJZl+c3Ce+fuWuJ+zLYxzzvecm8U2ZQ=;
 b=EN5SlaItybv0AXWY3dV4IiykYywkYc3MMcJ+GYIzFyQZaNPmF7LgEZkq2Ajc2ojcBy
 MPX62y7gGpZHFPllQRicRJ7BlrtpqRIuy5snSawr1LKUmijPZs4xcjigpGmSiP5qr5qU
 iSCZ5Igr5Db2bmMLT2I6WadC04JOUl7wXFCUHz0RiW3Dc4F1eFWacWCC+YjiEGeHryg0
 k9rpss4hPD6iRV5s/Zuf7QcI3cF4+O+2rOxiLevcFLqtuzDSXPItNDAiAVAQo+ST8DZt
 jyNOo/+me7KgmoYneH7kl1ZliWRxJKMtdmd+DVKwjLk0BBkLVdH0vPbvMW1co9u3ALWG
 wTJw==
X-Gm-Message-State: AOAM532LbFxg6zG5u3bcTTa97K7GQpoqJA0HJ5acfXxW2WfX9ttc4PLt
 UcMS5E0VrwJGpNmdGKjEnEO/Gw==
X-Google-Smtp-Source: ABdhPJyhQwehdC5E5vWdp2tq0inGEyTI0AsEuhIDReVDRKACyOC/THNq1DETNswb/m5QQ3kSVY3afQ==
X-Received: by 2002:a1c:7315:: with SMTP id d21mr8770056wmb.108.1594825602210; 
 Wed, 15 Jul 2020 08:06:42 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id w2sm3906140wrs.77.2020.07.15.08.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 08:06:41 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 06/14] spi: spi-meson-spicc: Remove set but never used
 variable 'data' from meson_spicc_reset_fifo()
Date: Wed, 15 Jul 2020 16:06:24 +0100
Message-Id: <20200715150632.409077-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715150632.409077-1-lee.jones@linaro.org>
References: <20200715150632.409077-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_110643_253802_C9C4ECCF 
X-CRM114-Status: GOOD (  10.86  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

TG9va3MgbGlrZSBpdCBoYXNuJ3QgZXZlciBiZWVuIGNoZWNrZWQuCgpGaXhlcyB0aGUgZm9sbG93
aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKCiBkcml2ZXJzL3NwaS9zcGktbWVzb24t
c3BpY2MuYzogSW4gZnVuY3Rpb24g4oCYbWVzb25fc3BpY2NfcmVzZXRfZmlmb+KAmToKIGRyaXZl
cnMvc3BpL3NwaS1tZXNvbi1zcGljYy5jOjM2NTo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkYXRh
4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCiAzNjUgfCB1
MzIgZGF0YTsKIHwgXn5+fgoKQ2M6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+
CkNjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CkNjOiBsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpY2MuYyB8IDQg
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1tZXNvbi1zcGljYy5jIGIvZHJpdmVycy9zcGkvc3Bp
LW1lc29uLXNwaWNjLmMKaW5kZXggNzdmN2QwZTBlNDZhZC4uZWNiYTZiNGE1ZDg1ZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9zcGkvc3BpLW1lc29uLXNwaWNjLmMKKysrIGIvZHJpdmVycy9zcGkvc3Bp
LW1lc29uLXNwaWNjLmMKQEAgLTM2Miw4ICszNjIsNiBAQCBzdGF0aWMgdm9pZCBtZXNvbl9zcGlj
Y19zZXR1cF94ZmVyKHN0cnVjdCBtZXNvbl9zcGljY19kZXZpY2UgKnNwaWNjLAogCiBzdGF0aWMg
dm9pZCBtZXNvbl9zcGljY19yZXNldF9maWZvKHN0cnVjdCBtZXNvbl9zcGljY19kZXZpY2UgKnNw
aWNjKQogewotCXUzMiBkYXRhOwotCiAJaWYgKHNwaWNjLT5kYXRhLT5oYXNfb2VuKQogCQl3cml0
ZWxfYml0c19yZWxheGVkKFNQSUNDX0VOSF9NQUlOX0NMS19BTywKIAkJCQkgICAgU1BJQ0NfRU5I
X01BSU5fQ0xLX0FPLApAQCAtMzczLDcgKzM3MSw3IEBAIHN0YXRpYyB2b2lkIG1lc29uX3NwaWNj
X3Jlc2V0X2ZpZm8oc3RydWN0IG1lc29uX3NwaWNjX2RldmljZSAqc3BpY2MpCiAJCQkgICAgc3Bp
Y2MtPmJhc2UgKyBTUElDQ19URVNUUkVHKTsKIAogCXdoaWxlIChtZXNvbl9zcGljY19yeHJlYWR5
KHNwaWNjKSkKLQkJZGF0YSA9IHJlYWRsX3JlbGF4ZWQoc3BpY2MtPmJhc2UgKyBTUElDQ19SWERB
VEEpOworCQlyZWFkbF9yZWxheGVkKHNwaWNjLT5iYXNlICsgU1BJQ0NfUlhEQVRBKTsKIAogCWlm
IChzcGljYy0+ZGF0YS0+aGFzX29lbikKIAkJd3JpdGVsX2JpdHNfcmVsYXhlZChTUElDQ19FTkhf
TUFJTl9DTEtfQU8sIDAsCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
