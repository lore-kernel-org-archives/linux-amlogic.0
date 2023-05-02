Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09078C77B78
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 May 2023 20:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3YCyk3ZW68eHb76WS0mNax9ciKwUJCYkY836/ST63l8=; b=rGyBEbyTDaLdmZ
	SqQSiQDCiP3SDPPvvB7ZZm05Etw48o9rCyviVkhKv2AnH4bcDH40j61bdIhDn0zImFKPcnoBBYyan
	VDpX5mnKzEYio0aG0xgj8WukM8dYzBzrbxzDmRzGX52w9S2EEQPUyeDXDC5EG60rGMo765oA8abIB
	RGx78bFJ4VmB08bYTAQZsgpxh2tEhw4zr/lgbRaRtQM/52czt7RKLmwS2Pl+FwPbrLZp5wFkgWQLw
	lcFNLole9/JvN9kh0Xsubwerk+6wsV/a/IlJWvFi6XmVv1cfvn7MIZ2giCibgZwBEtOJ2GTP/iFNY
	uxxqm33C8h7LZstq5L4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptwh5-002ard-2e;
	Tue, 02 May 2023 20:33:51 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptwh2-002aql-37;
	Tue, 02 May 2023 20:33:50 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50bc34b98edso5063904a12.3;
        Tue, 02 May 2023 13:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683059627; x=1685651627;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqHoRnIi56y0Eq3HCEEwB6zOQFkWe+lN+qtxHiWOfIo=;
        b=phKn5u/TpxfWZCCcLmERJjvTvteJbMzujNbodrPcubv/qRW1vTv/VeX/UslvCfav9f
         wvOzzHXIJ22a1IWgUq1c/c8HiQMbDuachoSGoAJvriCqC3L/AL8jdgw+xmSJTfwRYSBB
         QX1fJRe2av5Tu5yEfer8B4Z1kOHZgEt1EFVKHibM8AHGcT021+E6BVYu8ecsm4dn/O3n
         RkAzWa/DK2nZYS1HTd27JjxHjAQhIZYgZIcLm88qdhfWUTOhohgm5CVT/zL5WYCnOgWU
         1xXDv4I1Ssxpw4eEoRRvYdMmyj4oxyzUHerRLBTDRX9PXB1vCz0haGWlIUPJCpnS43Mi
         srag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683059627; x=1685651627;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BqHoRnIi56y0Eq3HCEEwB6zOQFkWe+lN+qtxHiWOfIo=;
        b=OrAFtYUkRk5ruJmICoiU299EuyTvFj33x3Mr5OFj2blpbqvnIWX1EyGNjyWuq04kf/
         FqUGotpI3v5snIcm5eT0ME8OKKO7swaBdRfyyTgLfXtHTW2qZo9C0O57WB1xzMZBhwsc
         a4+18Py5Azux9bXmnlwBY4fEQXEcwDRWLyw+of6Ki5Jvb7nu0t53ez014DrXLEIMS+7m
         DzJb9+Rsgb0L4ue1WoKRuaPvoUO1iJh6HXzmSq51z0NUA/M3/YLV9FP01p9+1gvTI7M3
         lqgSBwUoJ2dE2pAMJCyT57RcuwvIDrbDjxChjHGVRf5cKXSZEJcpRu0qlbRmbVwlWhNz
         LB0A==
X-Gm-Message-State: AC+VfDw2gqKj43moShDk84cjKhwJBuCHy5XGsRH73zhg7/4FYJYC1UKk
	0FH7fiQNHLbnYCOGvM3qbkI=
X-Google-Smtp-Source: ACHHUZ7CpHN6a9lznliOqn1nanEQFGERN1R9MhRwy+t7+nNLrxSwICk5kKcVFMCPWPweRKH8bmA+dA==
X-Received: by 2002:a17:907:7e8d:b0:94d:a2c2:9aeb with SMTP id qb13-20020a1709077e8d00b0094da2c29aebmr1512829ejc.49.1683059627094;
        Tue, 02 May 2023 13:33:47 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9545:b300:8dc9:588b:ac03:5082? (dynamic-2a02-3100-9545-b300-8dc9-588b-ac03-5082.310.pool.telefonica.de. [2a02:3100:9545:b300:8dc9:588b:ac03:5082])
        by smtp.googlemail.com with ESMTPSA id la5-20020a170906ad8500b0094e877ec197sm16727262ejb.148.2023.05.02.13.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 13:33:46 -0700 (PDT)
Message-ID: <23fe625e-dc23-4db8-3dce-83167cd3b206@gmail.com>
Date: Tue, 2 May 2023 22:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
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
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3] pwm: meson: modify and simplify calculation in
 meson_pwm_get_state
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_133349_008766_0C8B3D41 
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
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2ln
bmVkLW9mZi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KLS0tCnYy
OgotIGltcHJvdmUgY29tbWl0IGRlc2NyaXB0aW9uCnYzOgotIG1ha2UgcGF0Y2ggYSBmaXgKLS0t
CiBkcml2ZXJzL3B3bS9wd20tbWVzb24uYyB8IDE0ICsrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3B3bS9wd20tbWVzb24uYyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCmluZGV4IDU3MzIz
MDBlYi4uMzg2NTUzOGRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYworKysg
Yi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwpAQCAtMzUxLDE4ICszNTEsOCBAQCBzdGF0aWMgaW50
IG1lc29uX3B3bV9nZXRfc3RhdGUoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2Rl
dmljZSAqcHdtLAogCWNoYW5uZWwtPmxvID0gRklFTERfR0VUKFBXTV9MT1dfTUFTSywgdmFsdWUp
OwogCWNoYW5uZWwtPmhpID0gRklFTERfR0VUKFBXTV9ISUdIX01BU0ssIHZhbHVlKTsKIAotCWlm
IChjaGFubmVsLT5sbyA9PSAwKSB7Ci0JCXN0YXRlLT5wZXJpb2QgPSBtZXNvbl9wd21fY250X3Rv
X25zKGNoaXAsIHB3bSwgY2hhbm5lbC0+aGkpOwotCQlzdGF0ZS0+ZHV0eV9jeWNsZSA9IHN0YXRl
LT5wZXJpb2Q7Ci0JfSBlbHNlIGlmIChjaGFubmVsLT5sbyA+PSBjaGFubmVsLT5oaSkgewotCQlz
dGF0ZS0+cGVyaW9kID0gbWVzb25fcHdtX2NudF90b19ucyhjaGlwLCBwd20sCi0JCQkJCQkgICAg
Y2hhbm5lbC0+bG8gKyBjaGFubmVsLT5oaSk7Ci0JCXN0YXRlLT5kdXR5X2N5Y2xlID0gbWVzb25f
cHdtX2NudF90b19ucyhjaGlwLCBwd20sCi0JCQkJCQkJY2hhbm5lbC0+aGkpOwotCX0gZWxzZSB7
Ci0JCXN0YXRlLT5wZXJpb2QgPSAwOwotCQlzdGF0ZS0+ZHV0eV9jeWNsZSA9IDA7Ci0JfQorCXN0
YXRlLT5wZXJpb2QgPSBtZXNvbl9wd21fY250X3RvX25zKGNoaXAsIHB3bSwgY2hhbm5lbC0+bG8g
KyBjaGFubmVsLT5oaSk7CisJc3RhdGUtPmR1dHlfY3ljbGUgPSBtZXNvbl9wd21fY250X3RvX25z
KGNoaXAsIHB3bSwgY2hhbm5lbC0+aGkpOwogCiAJc3RhdGUtPnBvbGFyaXR5ID0gUFdNX1BPTEFS
SVRZX05PUk1BTDsKIAotLSAKMi40MC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
