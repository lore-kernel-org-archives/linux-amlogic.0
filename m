Return-Path: <SRS0=FxSk=45=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDFBC10DCE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 18:23:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1AA920716
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 18:23:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DZwwdXM9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0g4KW02"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1AA920716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDBHhAEtOQ84OnnvyeEWLcQjYcNIualJ78j7XtRTwr4=; b=DZwwdXM9DbvxRk
	eWjuVleww2mgDuchccUOmO1SHYSRV55rlIf2VBIRCroDoRODWLMePLB6hdWae24BAoH0yZAbswsaH
	dWBEhi7ot3A+u/IOTusV0ES9tBU5t4tK9O31zYlm97O/0P97v68GLdm1KRYfe7lhvNcGSSoI6nVQV
	/Cl+K+KV/XkbMN3klltAhFQLBnGpULx+Fq/YFG3QEsiYDvS5Hc1Gig+TcfdVEqJdVBZuorQy3sEy/
	L84M1/pPVEB3r9YLauEKxeQTsRt+jwHpUqgm3I+15oLwGzkKzAXb4WdiV7EOzm25hyQ+PV3RaVx4u
	D9RrmWwAInFGeYpQS7Bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCSUn-0005qF-Fv; Thu, 12 Mar 2020 18:23:49 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCSUl-0005pK-3z
 for linux-amlogic@lists.infradead.org; Thu, 12 Mar 2020 18:23:48 +0000
Received: by mail-wm1-x343.google.com with SMTP id t13so1102799wmi.3
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Mar 2020 11:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I14sMSo/8MVABSeQ92m+2OlhrLjEldKHbCJhA070FMM=;
 b=w0g4KW0228iK6+VDBJuLrvfGiYRjECwQ/QqYZjJtsZw49UoCTxVQPtDn4OHUpzfKg1
 voeA2jH5ucovbtQWB+7FlVurob7LeCLqLsM6XBaxwWs6Cie+9zydk1jTEcn5hvb0oBJe
 benilUYQCNJwlIOA4E4dfilPB/3WJzRN+reyechxBdXydB9FXgootOixx+M8oNKj0Qo8
 StRKVl0gD42VSEYYJbEP5bcCOflrslJZFk/phkBrP9NZiccShNAccCKjNEVFBqDF8Dwz
 jwgzEADqv6u0pqbSIxRx5dWHyddhcOiq7WDhTVqH9gYAMEnYK0kXSXtVWUlZN/Eydp0I
 Eyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=I14sMSo/8MVABSeQ92m+2OlhrLjEldKHbCJhA070FMM=;
 b=t+jp1QHfMnxoc1FVM+C9LvD2ECugZKgFHFuya97yvjN5rZ9v3SlXeprOlt0TZo774r
 CvU6L5fZIkYjVSVJpFlglVfXzrDgEbEZdmbapqSr52gSJHvCF3Mer+t9o7wXvQOMKnbt
 Y3HWJy/8fP3SprJGK71aeoc22d9h9ca3iVKQHhDfAjDqGQ0FgPuKFDbAcS/VZ/8yWd4i
 IjElPqKxoThgafYGJcKrl/8ekAofSRISXayg+FUIGPnPqq1U60Jm9Xx+8QEBNA/MJZC7
 uID3w2X8z7gumqzZXqp1rkcdOSzBtbQZhzpc5GOXr6rpUFqvRE4wNIGpo3ykhZfql/g4
 djPw==
X-Gm-Message-State: ANhLgQ1fjXUVb3joX710iU60PQ6RRS/LdJCf9zMkgBA+wLsrSxH7gm8Y
 Fe6JQlGpAbyrVgrrXts343L2hQ==
X-Google-Smtp-Source: ADFU+vuZRPmXNVd/LKfPf15f9qSqMadHf8m57Uw4rOxFRNKNQTdJzLXAx35N7q+n5AmsrIp0Fp5MEw==
X-Received: by 2002:a1c:44b:: with SMTP id 72mr6182095wme.116.1584037424748;
 Thu, 12 Mar 2020 11:23:44 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:40fb:3990:3519:cc26?
 ([2a01:e34:ed2f:f020:40fb:3990:3519:cc26])
 by smtp.googlemail.com with ESMTPSA id e7sm56423305wrt.70.2020.03.12.11.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2020 11:23:44 -0700 (PDT)
Subject: Re: [PATCH v4] clocksource/drivers/timer-cs5535: request irq with
 non-NULL dev_id
To: afzal mohammed <afzal.mohd.ma@gmail.com>
References: <e47ba222-bf4e-d13c-fbd3-6e7952097188@linaro.org>
 <20200312064817.19000-1-afzal.mohd.ma@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b7541667-05e1-6a54-165f-7d8ad66f5b33@linaro.org>
Date: Thu, 12 Mar 2020 19:23:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312064817.19000-1-afzal.mohd.ma@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_112347_229884_754109CA 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: kstewart@linuxfoundation.org, linus.walleij@linaro.org, shawnguo@kernel.org,
 festevam@gmail.com, f.fainelli@gmail.com, khilman@baylibre.com,
 krzk@kernel.org, kgene@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 allison@lohutok.net, u.kleine-koenig@pengutronix.de, linux-imx@nxp.com,
 rjui@broadcom.com, s.hauer@pengutronix.de, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, baohua@kernel.org, sbranden@broadcom.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux@prisktech.co.nz, kernel@pengutronix.de, info@metux.net,
 nsaenzjulienne@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTIvMDMvMjAyMCAwNzo0OCwgYWZ6YWwgbW9oYW1tZWQgd3JvdGU6Cj4gUmVjZW50bHkgYWxs
IHVzYWdlcyBvZiBzZXR1cF9pcnEoKSB3YXMgcmVwbGFjZWQgYnkgcmVxdWVzdF9pcnEoKS4KPiBy
ZXF1ZXN0X2lycSgpIGRvZXMgYSBmZXcgc2FuaXR5IGNoZWNrcyB0aGF0IHdlcmUgbm90IGRvbmUg
aW4KPiBzZXR1cF9pcnEoKSwgaWYgdGhleSBmYWlsIGlycSByZWdpc3RyYXRpb24gd2lsbCBmYWls
LiBPbmUgb2YgdGhlIGNoZWNrCj4gaXMgdG8gZW5zdXJlIHRoYXQgbm9uLU5VTEwgZGV2X2lkIGlz
IHBhc3NlZCBpbiB0aGUgY2FzZSBvZiBzaGFyZWQgaXJxLgo+IAo+IEZpeCBpdCBieSBwYXNzaW5n
IG5vbi1OVUxMIGRldl9pZCB3aGlsZSByZWdpc3RlcmluZyB0aGUgc2hhcmVkIGlycS4KPiAKPiBG
aXhlczogY2MyNTUwYjQyMWFhICgiY2xvY2tzb3VyY2U6IFJlcGxhY2Ugc2V0dXBfaXJxKCkgYnkg
cmVxdWVzdF9pcnEoKSIpCj4gU2lnbmVkLW9mZi1ieTogYWZ6YWwgbW9oYW1tZWQgPGFmemFsLm1v
aGQubWFAZ21haWwuY29tPgo+IC0tLQo+IAo+IEhpIERhbmllbCwKPiAKPiBpIGhhdmUgYXNzdW1l
ZCB0aGF0IHlvdSB3b3VsZCBub3QgcmViYXNlIHlvdXIgZHJpdmVycy9uZXh0IHRyZWUgJiBwdXQg
dGhlCj4gU0hBLWlkIGluIEZpeGVzIHRhZy4KCkFwcGxpZWQsIHRoYW5rcwoKCi0tIAogPGh0dHA6
Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdl
cy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3
aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
