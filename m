Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E95C636CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 07:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrbgcQX+96neWlZuW8qG2aiY/OHpaSBiXSwcQyFqUDg=; b=tA6Um9o3oDlyDn
	5YIc4liTccRD4CVDelvY/CH99FK2zQYQkkIDoFnROCorudbWUQrhfVe5z/CePFXJIskNdI17A22b8
	fkjcTamT0ctg5NQjVHcxMIgDvBLpJqbpQM0yg03BrN/1r3J0v5lWATPJS18zyB3OloMUhikXeh1Tu
	yndQZsgkV2GjqI8jYO1af/uuUM0a0lD1+gh39kcGJy9nMW2IUPgPOu4kRdxvFBAEsw0vYWnuU89GB
	fVBcmDE6eFlBBo5uynWVqhsZdYSylf+9x7bwTvqL31a9vmKpAOo9EkX1tZMx7F1uFmE9iTzDCtGEG
	x+5FhYt9ZyvIcEQ5/5kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQkhQ-008y93-Lx; Sat, 11 Feb 2023 07:53:32 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQkhK-008y7Q-1u
	for linux-amlogic@lists.infradead.org; Sat, 11 Feb 2023 07:53:28 +0000
Received: by mail-wr1-x42b.google.com with SMTP id h16so7303998wrz.12
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Feb 2023 23:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JdyJlJsLe7UYj3HkIh5IqELvu3xeVrpcZYgePszZnTM=;
        b=GLB3/AzmYk9r6d1M8HG+Xa6zUYiLBVeTfksz30BKXtFLjMOZAJt3SBE6RyR0tbn5MS
         DD4H3wi9V/SDQuDV3tGPPSl8qpypTSQsfCfK9egDFUGuj9TX5Bg/7M3aEj2dHPApTycE
         iVMMPBpYzZd0VtnU+lA9CnOYU9IA+UskmGMUMP/allk6UxbMwLl0hBxkiWxnQmmDhNk0
         Bz8WSmwAI5ueU77V8JEpyzEs5FhACjZuwfsvwtP+cMXV+L1AwI+vifHHRly2zvJG0jsk
         5IC2zBZPyhqDHEfyrpQvPJ1em2+wFTVJbqpatXgKrf7ezzHV/rk2Pm3qw34jJSH51cPz
         XCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JdyJlJsLe7UYj3HkIh5IqELvu3xeVrpcZYgePszZnTM=;
        b=paDAW3nxhwm2BWdCsLobxbXE2vmRuW7cUQwEzW6dBr55W91qg290aZtlgHxx8hsVpd
         Wayu21XDPWjsQtd64T6vj6NDJeUGVPgqlksoGz0KpPK+NePHw4gmnT9MQq8UHnA05qIf
         TvEvlBdPr44Yehw2IWQjEnf6H9czRtOua23oKkkiiGE1Ca2p0wCiiWnWYptPJhEfcJmt
         kG7kD02IsPm6zqATUhRZw1AGM+KcuXODtYeyruxg9Af3uqj7lH00xC7cRPwGFueqPbrM
         V223zYlK19lbLN9x8pXDUZvl2V/eByYK9uFizVy7tpDCswgoo1YZ88bc+3uQlOLmy+b9
         4mKQ==
X-Gm-Message-State: AO0yUKVfnkSC1nUgH7L/4HlhZwor2sNaXc2vi0l7b3hHHSNOUv261jpd
	QhRWQwim+7QGKrQcF0ZW9kr/cA==
X-Google-Smtp-Source: AK7set8ejeEopWyNZYhHew3TugHJmthNV0eduJzyC9rqBpPCVupmvHmzId1Mb4lViYTHg0iv3ePIXA==
X-Received: by 2002:a05:6000:8:b0:2bf:b5e4:cd63 with SMTP id h8-20020a056000000800b002bfb5e4cd63mr15123447wrx.8.1676102003159;
        Fri, 10 Feb 2023 23:53:23 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id q4-20020a05600000c400b002c54737e908sm3787502wrx.91.2023.02.10.23.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 23:53:22 -0800 (PST)
Message-ID: <9a121d43-b6d9-fe99-1e4c-498dac2e6b17@linaro.org>
Date: Sat, 11 Feb 2023 08:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] thermal: Remove core header inclusion from drivers
Content-Language: en-US
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: rafael.j.wysocki@intel.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, ye xingchen
 <ye.xingchen@zte.com.cn>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Haowen Bai <baihaowen@meizu.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "open list:RENESAS R-CAR THERMAL DRIVERS"
 <linux-renesas-soc@vger.kernel.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
 <20230211021023.GA13306@ranerica-svr.sc.intel.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230211021023.GA13306@ranerica-svr.sc.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_235326_571340_1AED1D1E 
X-CRM114-Status: GOOD (  16.05  )
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

T24gMTEvMDIvMjAyMyAwMzoxMCwgUmljYXJkbyBOZXJpIHdyb3RlOgo+IE9uIE1vbiwgRmViIDA2
LCAyMDIzIGF0IDA0OjM0OjI5UE0gKzAxMDAsIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+PiBBcyB0
aGUgbmFtZSBzdGF0ZXMgInRoZXJtYWxfY29yZS5oIiBpcyB0aGUgaGVhZGVyIGZpbGUgZm9yIHRo
ZSBjb3JlCj4+IGNvbXBvbmVudHMgb2YgdGhlIHRoZXJtYWwgZnJhbWV3b3JrLgo+Pgo+PiBUb28g
bWFueSBkcml2ZXJzIGFyZSBpbmNsdWRpbmcgaXQuIEhvcGVmdWxseSB0aGUgcmVjZW50IGNsZWFu
dXBzCj4+IGhlbHBlZCB0byBzZWxmIGVuY2Fwc3VsYXRlIHRoZSBjb2RlIGEgYml0IG1vcmUgYW5k
IHByZXZlbnRlZCB0aGUKPj4gZHJpdmVycyB0byBuZWVkIHRoaXMgaGVhZGVyLgo+Pgo+PiBSZW1v
dmUgdGhpcyBpbmNsdXNpb24gaW4gZXZlcnkgcGxhY2Ugd2hlcmUgaXQgaXMgcG9zc2libGUuCj4+
Cj4+IFNvbWUgb3RoZXIgZHJpdmVycyBkaWQgYSBjb25mdXNpb24gd2l0aCB0aGUgY29yZSBoZWFk
ZXIgYW5kIHRoZSBvbmUKPj4gZXhwb3J0ZWQgaW4gbGludXgvdGhlcm1hbC5oLiBUaGV5IGluY2x1
ZGUgdGhlIGZvcm1lciBpbnN0ZWFkIG9mIHRoZQo+PiBsYXR0ZXIuIFRoZSBjaGFuZ2VzIGFsc28g
Zml4IHRoaXMuCj4+Cj4+IFRoZSB0ZWdyYS9zb2N0aGVybSBkcml2ZXIgc3RpbGwgcmVtYWlucyBh
cyBpdCB1c2VzIGFuIGludGVybmFsCj4+IGZ1bmN0aW9uIHdoaWNoIG5lZWQgdG8gYmUgcmVwbGFj
ZWQuCj4+Cj4+IFRoZSBJbnRlbCBIRkkgZHJpdmVyIHVzZXMgdGhlIG5ldGxpbmsgaW50ZXJuYWwg
ZnJhbWV3b3JrIGNvcmUgYW5kCj4+IHNob3VsZCBiZSBjaGFuZ2VkIHRvIHByZXZlbnQgdG8gZGVh
bCB3aXRoIHRoZSBpbnRlcm5hbHMuCj4gCj4gSSBkb24ndCBzZWUgYW55IG9mIHRoZSB0aGVybWFs
IG5ldGxpbmsgZnVuY3Rpb25hbGl0eSBleHBvc2VkLiBJcwo+IHRoZXJlIGFueSB3b3JrIGluIHBy
b2dyZXNzPwoKY29tbWl0IGJkMzBjZGZkOWJkNzNiNjhlNDk3N2NlN2M1NTQwYWE3YjE0YzI1Y2QK
QXV0aG9yOiBTcmluaXZhcyBQYW5kcnV2YWRhIDxzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4Lmlu
dGVsLmNvbT4KCiAgICAgdGhlcm1hbDogaW50ZWw6IGhmaTogTm90aWZ5IHVzZXIgc3BhY2UgZm9y
IEhGSSBldmVudHMKCgo+IEZXSVcsIEFja2VkLWJ5OiBSaWNhcmRvIE5lcmkgPHJpY2FyZG8ubmVy
aS1jYWxkZXJvbkBsaW51eC5pbnRlbC5jb20+CgpUaGFua3MhCgotLSAKPGh0dHA6Ly93d3cubGlu
YXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+
IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8
aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
