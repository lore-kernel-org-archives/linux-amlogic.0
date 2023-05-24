Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF85C77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 May 2023 19:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJhznXysbUe6iyL5UtmRanZxBVp2jW/zyDlWt4EdapY=; b=JRm8iHtvRu3+Kc
	aYJErI5M6E5IWMS+xH+ej1YjpxLgiyIPufCCjc6+r6qV0SjdSAWVyXCJ1aX7J5o8lVw8xO+bjbMyY
	/M/SgV26sBBiTI2uDxZbqceNjVC4nykKuf+3T3A1hHCyS+lPdowIhsUWMDjNlXmRCLv3IadlMTlrR
	/Tka48jrQzWwXqPsds/l78N4ORVRWB5jIyD6FXYXgYIrXGfQKtCN0tx1tUkwl+u00VAVpnKAYDntj
	jvvd5Beh0B7qvL5PQno/wrRD6bXUasKxHrrn+LH2xu2OxtdNa2slDhxtapd485QHw+VSJLnw6JPvx
	VT9EFbA7Idc5mfSBpqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uXO-00EWDX-0e;
	Wed, 24 May 2023 19:52:46 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uXL-00EWCf-0r;
	Wed, 24 May 2023 19:52:44 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-510d967249aso2859610a12.1;
        Wed, 24 May 2023 12:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684957959; x=1687549959;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FfpJcXgNC9r2DJpgp6E9iGBv/JmFVRlvC0D1pq4re0k=;
        b=RyeyFUci0Xkt3P2B6mgdNQYs5srDXC6YVdvztLyA0HhBmXkdEzPioa6aoT2CbHeCCh
         vwrKMEXZA9hWTdO2IW4nQQSn2NLYjjSzx01lJoQtVMzyQ2QrvDnpjIQ9S/L/oau1bhtG
         ouY/95M7IpRpLWExR8yefpbOoekwlXHa6YG4UKzOFu+l0AJ9FdjKkd/72CNYM/GhbLsd
         EVwW+IN+x8sUJEBFovKYJMD51o0/a7f0C1U0BQLr+kJi0r8Rv/oqrPcS+mvd6Q/A+R5O
         9SetGwMTAlbUWxAqwwaGtL5DEMwy/z/yRIKOHvbff+rA04BMj//G47ihP2NvpfKq1Kpx
         z6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684957959; x=1687549959;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FfpJcXgNC9r2DJpgp6E9iGBv/JmFVRlvC0D1pq4re0k=;
        b=S+zvxEtQFGxMBHojvM0IWTYBu7ziFInU7cRB5HDkMlP5yva+xqCMc34BQfns7GuVCu
         uYqpyrXWl3QKaGUKLKXESTymWfsxftQrB8oiuZKAlaIeFSVHnH5mD1fhYZh8pzcL1A/A
         MGxKo1OIxA/foX0gAbUBqNUHEZw/6ZdzxF899poRrNjLdc7ymg/Q5xB8lU90LTGbNHfv
         bV3DClhCmbICJcxaG+B9MzTLo8pu1kDF1QefnXPfsmjW5odzcM6NiWAWMsiy2mP2/18/
         ngXkbbryKWtmewQ+tRqL5sNubr00N0qMcpIO1bJi5/ty7GTlhxHGJsoq68/MFLYapKd5
         Cn5w==
X-Gm-Message-State: AC+VfDzdC5PDUc6eTYsoXqFU5XDTP+W75Ro7laAOaOWGk8BgYHzwH39/
	1BIGmTFtXUdIKa/U8hB3hYU=
X-Google-Smtp-Source: ACHHUZ5LNXTyD94Y8CVwqrQrbJL9IGSs2sEcAr6YfOqlSGqos84mpbqvuYMAKymvzgVdMu1Hx9bW2g==
X-Received: by 2002:a05:6402:187:b0:4fd:2b04:6e8b with SMTP id r7-20020a056402018700b004fd2b046e8bmr2979484edv.29.1684957958850;
        Wed, 24 May 2023 12:52:38 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c519:9c00:cd4b:d130:35c7:5e08? (dynamic-2a01-0c23-c519-9c00-cd4b-d130-35c7-5e08.c23.pool.telefonica.de. [2a01:c23:c519:9c00:cd4b:d130:35c7:5e08])
        by smtp.googlemail.com with ESMTPSA id bq2-20020a056402214200b00510d7152dc7sm249605edb.30.2023.05.24.12.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 12:52:38 -0700 (PDT)
Message-ID: <2f376c8b-32a9-a3a7-3454-4a864ab8ab44@gmail.com>
Date: Wed, 24 May 2023 21:47:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH v5 RESEND 1/6] pwm: meson: modify and simplify calculation in
 meson_pwm_get_state
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, Dmitry Rokosov <ddrokosov@sberdevices.ru>
References: <aa498590-261c-4ada-63ff-8d7aaeec0932@gmail.com>
In-Reply-To: <aa498590-261c-4ada-63ff-8d7aaeec0932@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_125243_323930_EB635D66 
X-CRM114-Status: GOOD (  11.72  )
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

SSBkb24ndCBzZWUgYSByZWFzb24gd2h5IHdlIHNob3VsZCB0cmVhdCB0aGUgY2FzZSBsbyA8IGhp
IGRpZmZlcmVudGx5CmFuZCByZXR1cm4gMCBhcyBwZXJpb2QgYW5kIGR1dHlfY3ljbGUuIFRoZSBj
dXJyZW50IGxvZ2ljIHdhcyBhZGRlZCB3aXRoCmMzNzViY2JhYWJkYiAoInB3bTogbWVzb246IFJl
YWQgdGhlIGZ1bGwgaGFyZHdhcmUgc3RhdGUgaW4KbWVzb25fcHdtX2dldF9zdGF0ZSgpIiksIE1h
cnRpbiBhcyBvcmlnaW5hbCBhdXRob3IgZG9lc24ndCByZW1lbWJlciB3aHkKaXQgd2FzIGltcGxl
bWVudGVkIHRoaXMgd2F5IGJhY2sgdGhlbi4KU28gbGV0J3MgaGFuZGxlIGl0IGFzIG5vcm1hbCB1
c2UgY2FzZSBhbmQgYWxzbyByZW1vdmUgdGhlIG9wdGltaXphdGlvbgpmb3IgbG8gPT0gMC4gSSB0
aGluayB0aGUgaW1wcm92ZWQgcmVhZGFiaWxpdHkgaXMgd29ydGggaXQuCgpGaXhlczogYzM3NWJj
YmFhYmRiICgicHdtOiBtZXNvbjogUmVhZCB0aGUgZnVsbCBoYXJkd2FyZSBzdGF0ZSBpbiBtZXNv
bl9wd21fZ2V0X3N0YXRlKCkiKQpSZXZpZXdlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KUmV2aWV3ZWQtYnk6IERtaXRyeSBSb2tvc292IDxk
ZHJva29zb3ZAc2JlcmRldmljZXMucnU+CkFja2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgpDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29t
PgotLS0KIGRyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIHwgMTQgKystLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKaW5kZXgg
NTczMjMwMGViLi4zODY1NTM4ZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5j
CisrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCkBAIC0zNTEsMTggKzM1MSw4IEBAIHN0YXRp
YyBpbnQgbWVzb25fcHdtX2dldF9zdGF0ZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBw
d21fZGV2aWNlICpwd20sCiAJY2hhbm5lbC0+bG8gPSBGSUVMRF9HRVQoUFdNX0xPV19NQVNLLCB2
YWx1ZSk7CiAJY2hhbm5lbC0+aGkgPSBGSUVMRF9HRVQoUFdNX0hJR0hfTUFTSywgdmFsdWUpOwog
Ci0JaWYgKGNoYW5uZWwtPmxvID09IDApIHsKLQkJc3RhdGUtPnBlcmlvZCA9IG1lc29uX3B3bV9j
bnRfdG9fbnMoY2hpcCwgcHdtLCBjaGFubmVsLT5oaSk7Ci0JCXN0YXRlLT5kdXR5X2N5Y2xlID0g
c3RhdGUtPnBlcmlvZDsKLQl9IGVsc2UgaWYgKGNoYW5uZWwtPmxvID49IGNoYW5uZWwtPmhpKSB7
Ci0JCXN0YXRlLT5wZXJpb2QgPSBtZXNvbl9wd21fY250X3RvX25zKGNoaXAsIHB3bSwKLQkJCQkJ
CSAgICBjaGFubmVsLT5sbyArIGNoYW5uZWwtPmhpKTsKLQkJc3RhdGUtPmR1dHlfY3ljbGUgPSBt
ZXNvbl9wd21fY250X3RvX25zKGNoaXAsIHB3bSwKLQkJCQkJCQljaGFubmVsLT5oaSk7Ci0JfSBl
bHNlIHsKLQkJc3RhdGUtPnBlcmlvZCA9IDA7Ci0JCXN0YXRlLT5kdXR5X2N5Y2xlID0gMDsKLQl9
CisJc3RhdGUtPnBlcmlvZCA9IG1lc29uX3B3bV9jbnRfdG9fbnMoY2hpcCwgcHdtLCBjaGFubmVs
LT5sbyArIGNoYW5uZWwtPmhpKTsKKwlzdGF0ZS0+ZHV0eV9jeWNsZSA9IG1lc29uX3B3bV9jbnRf
dG9fbnMoY2hpcCwgcHdtLCBjaGFubmVsLT5oaSk7CiAKIAlzdGF0ZS0+cG9sYXJpdHkgPSBQV01f
UE9MQVJJVFlfTk9STUFMOwogCi0tIAoyLjQwLjEKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
