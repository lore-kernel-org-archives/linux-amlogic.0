Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E448C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 18:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNcJc6VF5NqfzIutjCG1MGr8+wWKBXTdilnLI9ArdGU=; b=ha5/f48HGZvJlz
	1hD0Baj4/PibOvv6S05WGPyoFpOmCsHecD7M81QpCTW5D7/fvvaDeSXI89adgN3kmmYrO5ANg+730
	PFcZ42H8ylgLCQvbtwzdM1iCKhTqeEvzSjHW1WMilWNxhfm1Y+cS8KExH9VXYl5J2b55KFihigeSY
	NF0EAlNZCj1TQYBoMCy5pWZd743mLMYHosT1EAu53FbA0tL2ShLlYllnOkR2qfu5BWf52dP9AaSta
	03WkAkuhGZyYAI87zEtN2CRzV7kEIfOj8IRJ5p7KzrHmZkEbcSPNzyvPWWVKcPGKoBDAQ8CE4Bb59
	FMcHJMsHUneSjhpM4WqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms8B7-006WSc-S4; Tue, 30 Nov 2021 18:48:33 +0000
Received: from mx.msync.work ([95.217.65.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms8B4-006WS3-Kc; Tue, 30 Nov 2021 18:48:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C5E601DE666; Tue, 30 Nov 2021 18:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1638298105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=2K089Pbd0oSMczdLCEfwYn+aFTao6UTxexX29vUAZ4k=;
 b=GDK6LiPto1hQd0z2ydVWtojuhoFlliIE5f9Hvkz+wCozJ3G48kGqwBwaedjDGcY77e/MaW
 9eDHb4L7vy1TGLg4Ggg9J0awigaKmRfFmlYpyybVbxKlSzBYyFe9OwNnOgtEYQ66/PWXqq
 WLLNXy1r2rvPnAoI+DGJdX0IbFWt+FRQOdeAXJbP/cYS5f45psBhLORBYqp9PGXCkTIkVJ
 hRLj6VGkbYeOTTo4fNGeAB94XmN4ErsLMp0j/whMc0lEQKuotUfSJXIZKPwB9FSpBGGiDp
 GfT3hDZBxRwI4SKoSkr25Be/pVeGCUeWRu4gAb9iFA/Zpxxq5UDuMdnTGCgakA==
Message-ID: <2ee1dea9-df39-ee76-4079-0ded15ed43c7@lexina.in>
Date: Tue, 30 Nov 2021 21:48:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] arm64: meson: fix dts for JetHub D1
Content-Language: ru
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20211125130246.1086627-1-adeep@lexina.in>
 <163826896367.1309037.1000352899984422910.b4-ty@baylibre.com>
From: Vyacheslav <adeep@lexina.in>
In-Reply-To: <163826896367.1309037.1000352899984422910.b4-ty@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_104831_044092_8DC10FC8 
X-CRM114-Status: UNSURE (   5.84  )
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

CgozMC4xMS4yMDIxIDEzOjQzLCBOZWlsIEFybXN0cm9uZyDQv9C40YjQtdGCOgo+IEhpLAo+IAo+
IE9uIFRodSwgMjUgTm92IDIwMjEgMTY6MDI6NDcgKzAzMDAsIFZ5YWNoZXNsYXYgQm9jaGFyb3Yg
d3JvdGU6Cj4+IEZpeCBtaXNwbGFjZSBvZiBjcHVfY29vbGluZ19tYXBzIGZvciBKZXRIdWIgRDEs
IG1vdmUgaXQgdG8gcmlnaHQgcGxhY2UuCj4+Cj4+Cj4gCj4gVGhhbmtzLCBBcHBsaWVkIHRvIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FtbG9naWMvbGlu
dXguZ2l0ICh2NS4xNy9kdDY0KQpUaGFua3MuIENvdWxkIHRoZSBwYXRjaCBnZXQgaW50byA1LjE2
PwoKPiAKPiBbMS8xXSBhcm02NDogbWVzb246IGZpeCBkdHMgZm9yIEpldEh1YiBEMQo+ICAgICAg
ICBodHRwczovL2dpdC5rZXJuZWwub3JnL2FtbG9naWMvYy8wM2NhZjg3ODIyMjIwYjRlMjJjMzQ5
ZDE3MDg4MWQxMjJkZjBiMzQ5Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
