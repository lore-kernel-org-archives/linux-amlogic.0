Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025FAC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Dec 2021 09:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8uN3qmdjmws8Z2NMGTAfnhATGEnwBwkeEgW+oq9pTpM=; b=zeBm581ebq9ez+W5Z5OQE0r2VZ
	nWq1fYZfe+2WyCQSAD2BaQ27GqTCgdWwmw1+9/To1591gyQfSaIUP2aNKIk/ojSrKqTJmd80eKb4D
	UwF8OA45vdoD4K9DWPekAFRR6jRGnjcgYA8EkDiv3uYbV3+3yIdc2voX9pnh6vZ6itZybP0zkAq1i
	8Y8Wg/fTpV8Zhe4MsIeE+C/l+GTIhTsA+Zqmj4wG40BCZXCqh5dIXXDUf7/UGG/VDzfQRADX58Sqp
	N64NtxyJjqL7SLU810p4zkSOYUaR4ym8eMdBrFfg9sxqoH7lmyroaYkokd5O+lIbkuLNMiD/dFalx
	6yUyAzyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msLsd-007w2j-OD; Wed, 01 Dec 2021 09:26:23 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msLsZ-007w25-Rv
 for linux-amlogic@lists.infradead.org; Wed, 01 Dec 2021 09:26:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id d9so29837946wrw.4
 for <linux-amlogic@lists.infradead.org>; Wed, 01 Dec 2021 01:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h6vtMpd8C2OVSmV4kXIfdV5q7UU768pshmu8uo8Dncs=;
 b=H9e7UsKFATLHgRApvxytRa6rR1qLReWi0Fxf21UaTOSFEH1zFudVH7ZXF4mDT9GTQ3
 kA2tbpbUKRx9aDnwoHav7ZAvxnB8UjiNAiUnvh52wFA66O93qfcSZQOy9E/yeiSoTGvT
 v1NALbM618jSQYef9DuNrDXoqFut0cugRzcdRTc3N+8ZqjmUAAQS76GKieX5V1x4dt5R
 i3iHBe/P6STvHiwW8WYm24G0wHptnZb2gjdlBso+WZAHcuC2OQPHWl7tUoZLYFFDYNWB
 91b3RX7VC16Jp0A+EkqANANqk1aKaokeO9i9YzMFyaEdTjcQOIZjO7dxx9v4ywBMnh79
 FjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=h6vtMpd8C2OVSmV4kXIfdV5q7UU768pshmu8uo8Dncs=;
 b=3bk/UlHIx24ubX4h+JD2gaaCxRYhtQrJcpshJmNwRA/0NWz4F7xevZlU8/3LjkZTNA
 LaUjCzZVWJ2ba0mVpORQzyHkx6YLC9PsHA0VooVYJng2Qj0pTb+1aaWjikQnIDnjFeXP
 MKbIxZC5ovDa1VhvQxB2D0K5jYj/3214ZJzrPg+ibhgCtF/VyGJdfBWyei0tFcnRP2mz
 Gk4j/QxRaW+H1u7+m2U7fYzSAvJ55EntGyZHNMIyq/Kldz2RZhuwPCiK0/FZaPhONNVF
 wKbp6eZSZd0tGiXg+D10Fzbl7uebR464kmtwPqAe3kT6k3GuQW0OKg1hpnFUFRtjJbps
 hmZA==
X-Gm-Message-State: AOAM530aZK2RFyutzds0lsXv73dEaXXeTY/OFOjzIDDd59WOIf8o70yX
 fhVqhK4STZsXjc7V4ILckf5/NvEwWgc1Du+L
X-Google-Smtp-Source: ABdhPJz5oJJMEyrhU9Df4sLOzl5l4NSa49qltp90IxNBFfQLiyMm6db7Ld4xZWuVzcGZO1xu+mhi+w==
X-Received: by 2002:adf:eb42:: with SMTP id u2mr5440858wrn.521.1638350778216; 
 Wed, 01 Dec 2021 01:26:18 -0800 (PST)
Received: from [10.1.3.24] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b13sm15555246wrh.32.2021.12.01.01.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 01:26:17 -0800 (PST)
Subject: Re: [PATCH] arm64: meson: fix dts for JetHub D1
To: Vyacheslav <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20211125130246.1086627-1-adeep@lexina.in>
 <163826896367.1309037.1000352899984422910.b4-ty@baylibre.com>
 <2ee1dea9-df39-ee76-4079-0ded15ed43c7@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <cb425c20-f699-7b24-2ef3-d798f417d09c@baylibre.com>
Date: Wed, 1 Dec 2021 10:26:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2ee1dea9-df39-ee76-4079-0ded15ed43c7@lexina.in>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_012619_915221_35222C79 
X-CRM114-Status: GOOD (  10.05  )
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

T24gMzAvMTEvMjAyMSAxOTo0OCwgVnlhY2hlc2xhdiB3cm90ZToKPiAKPiAKPiAzMC4xMS4yMDIx
IDEzOjQzLCBOZWlsIEFybXN0cm9uZyDQv9C40YjQtdGCOgo+PiBIaSwKPj4KPj4gT24gVGh1LCAy
NSBOb3YgMjAyMSAxNjowMjo0NyArMDMwMCwgVnlhY2hlc2xhdiBCb2NoYXJvdiB3cm90ZToKPj4+
IEZpeCBtaXNwbGFjZSBvZiBjcHVfY29vbGluZ19tYXBzIGZvciBKZXRIdWIgRDEsIG1vdmUgaXQg
dG8gcmlnaHQgcGxhY2UuCj4+Pgo+Pj4KPj4KPj4gVGhhbmtzLCBBcHBsaWVkIHRvIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FtbG9naWMvbGludXguZ2l0
ICh2NS4xNy9kdDY0KQo+IFRoYW5rcy4gQ291bGQgdGhlIHBhdGNoIGdldCBpbnRvIDUuMTY/Cj4g
Cj4+Cj4+IFsxLzFdIGFybTY0OiBtZXNvbjogZml4IGR0cyBmb3IgSmV0SHViIEQxCj4+IMKgwqDC
oMKgwqDCoCBodHRwczovL2dpdC5rZXJuZWwub3JnL2FtbG9naWMvYy8wM2NhZjg3ODIyMjIwYjRl
MjJjMzQ5ZDE3MDg4MWQxMjJkZjBiMzQ5Cj4+CgpNb3ZlZCB0byB2NS4xNi9maXhlcyB3aXRoIGZp
eGVzIHRhZzoKRml4ZXM6IDhlMjc5ZmIyOTAzOSAoImFybTY0OiBkdHM6IG1lc29uLWF4ZzogYWRk
IHN1cHBvcnQgZm9yIEpldEh1YiBEMSIpCgpOZWlsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
