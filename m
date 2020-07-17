Return-Path: <SRS0=P5SD=A4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CBAC43457
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 13:55:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B2C207DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 13:55:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KFR2np6J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JqcHwGwY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8B2C207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DiWVIoMTXEJzAPwVmJGBBwCvhh/F0Z5oqr1xYKdqGvk=; b=KFR2np6Jze4IKkjnCaNjOdfnz
	0KKAoaYtfXtnzcX1CfTTK081FTcgivlwPU9QD/7Dqj8hks2oy4uUxvtTdxTvE5OJIbQlD7NGXIinM
	1zl5Xs2CcxTlmqprWIhKE6E/RGorDDOxdHpfS80b5a3Yfk7DrUX2I0ID7NhPk+rNkKCX+iR1jH7/g
	EKeikTfuQc8oTXppDpuGn2zUuOQT7kLgNMil5xPnp/5A+vJwvsu1t+qDPgob6UDazTTk6SeknkbO4
	paEUX9KKMDpgWz8U1ReEeXDLN3SoMkdrEdYN41H3IIB1bHutbiK9Wp0PGiTDlFyK5sTrGFC2nuDvj
	XBJ2eOphA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwQpM-000349-WE; Fri, 17 Jul 2020 13:55:05 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwQor-0002rr-UH
 for linux-amlogic@lists.infradead.org; Fri, 17 Jul 2020 13:54:34 +0000
Received: by mail-wr1-x441.google.com with SMTP id s10so11160713wrw.12
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Jul 2020 06:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Neuk7hlxyMHOEJZl+c3Ce+fuWuJ+zLYxzzvecm8U2ZQ=;
 b=JqcHwGwYT8ZTvOUrpYD9UCG8OknPKe8KLct5xkbhm9XKF4P4uYR3ON03DVJiunjCn9
 QalPNLZvjQnz3T1ZZ9giCZ7GjjqGSi2w13uo8hMx3L+J4wM+SCKHoJ7knI9Kd9M/nlGt
 o2wI1kB21f9JI/xRneRKdJMNoMlJAyRmqfVA58DfnQrFib3EINkomufdHtBctOOj2LIW
 QTMr9rlzAWo6+J4efQMbIqi8bDow/ngNWRzB8LMci5NiRtYIKlNTofQTrypuLrgTkW7c
 HVDsTyXjFUajMUuSHCJRL7I3fU2YEwA78dG7meEnNEPs3ruKpDUG/HVmR6gs+ydyy2Hu
 f9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Neuk7hlxyMHOEJZl+c3Ce+fuWuJ+zLYxzzvecm8U2ZQ=;
 b=E7hXFpbc5y7xvBfEB8pQUO4B6ETPtmGonLDPAXEmziYFdLcF7v9HFtzS8uyH34CJAX
 bQ9SCZU4DRJ07znry8PhTx6vfrbxxcjNYV+Sv/E6xpOw6rRTBKXqxnaa2CW4DAUUVPjV
 wgy2d3R6NMQvemeNwd/rWvQaWswcat2O0q/0IaQdUOLaDoyfMjIcxQj0tFTVtaxIivlY
 isXjkF5TsyqzbQV054OX0twJ5gLwtGFmfizlD8j0nqjiLRujf439oCZPlpGMCWcS4eYk
 /dW/j9/tel1k1FHS6WQoSSSWaHgBn9rsN53zReueKBKdnDwFUUm9vT8+JURIqHMFQych
 GwzA==
X-Gm-Message-State: AOAM531q+tUPnza0CwjDAYWSQ5Z2nu7bjK91n+op7Bvg0haZkUnnhty9
 1527vdp/8s9grxRK0/48SRiInw==
X-Google-Smtp-Source: ABdhPJz3szDLxEUogVXdh3Zg2yz5Kc9c/NDxZApAW0Y6M9e5ChL8WhgjNGUtkoELCEPuIq+gwAJAiA==
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr10685903wrn.241.1594994073095; 
 Fri, 17 Jul 2020 06:54:33 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.94])
 by smtp.gmail.com with ESMTPSA id w128sm16118356wmb.19.2020.07.17.06.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 06:54:32 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 06/14] spi: spi-meson-spicc: Remove set but never used
 variable 'data' from meson_spicc_reset_fifo()
Date: Fri, 17 Jul 2020 14:54:16 +0100
Message-Id: <20200717135424.2442271-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200717135424.2442271-1-lee.jones@linaro.org>
References: <20200717135424.2442271-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_095434_066810_42BC670C 
X-CRM114-Status: GOOD (  10.64  )
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
