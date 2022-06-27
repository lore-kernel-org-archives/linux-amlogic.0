Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBA3C43334
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jun 2022 09:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0Q7DXNzTHzcTlioxiHgY5uuC4nxKE82nbEyI2ugshU=; b=V3A5IHrPTxysNjKhRnUR2ETCHL
	MsGQc5S2/oMlrvlv+nktga94Xl/7PiQjrbk1w/UCcHvy6xHb5FGoYXEnSQ88G9rz0CkAtWpw+sGDO
	Hh5+CpdgjQ7MKAZ26CIHhjyRdZCjfBy5KtQv3wSI6rV7k3cHt/SnFxC9cDpUd10Px1K2QMgVCl8/Z
	Ftcbqv1Supn9+qPL+s8dwGAs6SgrBgXDnHQcsouOQ2p8Kj7gmftTxknv8HLxJUIDCokt05qinP8Wu
	HlzVP8X71sFuj44c0LX4aiT8NhpA8HsCSppCcPPPYjoHUWF4n7XHvmdXh7E7W5Oa4YKEjkBTONLwp
	wJQR10Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5lDQ-00HOEu-2B; Mon, 27 Jun 2022 09:39:32 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5lDG-00HOAK-77
	for linux-amlogic@lists.infradead.org; Mon, 27 Jun 2022 09:39:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id q5so6820355wrc.2
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Jun 2022 02:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=07t8AwFbJGJZ2fYMAI5VwNCAFdeuEaIMoNRK7zzuSAc=;
        b=qJQ8TF1FRyNW82UWAnPyWQek6dD9xzjW9vHZiwj9VVM32/CX5xvPorhOaQviuEFxDi
         SExR/N6ZKgTdseHaowxH3xCqEtPRR9Yb6BnUNTK3jjnbxHsynIg1PEyGSeWpx7ioQwqw
         Hfk3kYL3H0MaQhBg7bADPZ46PPdQjYJP28J3yyKFD/XItEJu7oTWMC3Ipni/XryQ6vVr
         jMeXwMYRq2MRPCiX/ODUYvlszSAheKeNUM8VCKwwNj7xa1MQEVLSiTTRnYJ9hxtPb9h+
         qSwa6kZwBWKgNe2s+VWH6NwSuznQHMrIbAcNSYG3ZevbMJvm1hqxxwMgiaU6E0p5xm+r
         VzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=07t8AwFbJGJZ2fYMAI5VwNCAFdeuEaIMoNRK7zzuSAc=;
        b=Yypg4TdarAmi91cPC+J6bx8MLwdQb4uqtIvseHltqwBkwfWEuEjCY2ee9lHJyMLIqd
         At3nZ64SQE64HDr54j2pZ8Z22RW5f7mVF123idt8xPvmznc0YRlSYb+nBL3CocN5OXfL
         xB6k+zZnI1xJ3IP+aHlSkcuDKA8qIW1jUcDNHVmgVcPn4Fq4vH7Ki10YGsWl0w87gjql
         ISd7lLlruciI1PcFKGsu8ypqfUWlqhFE1P6boEwgZqcq2+pn33P88Rkdxuy6kt4AktFE
         1T4BaCSBCvmdAR71e2ROQu/7Is0dz1bP/ZaAV7zXPvb05dtBTOTOSzK4A7hH19X+yxoO
         K+tA==
X-Gm-Message-State: AJIora8+mW/A93WCW5kMw+OlOKsNACVaCAezWFefWxnr2ArcfR7GFuJf
	vEOul0vekVp3qPKmMaVzf8fXBQFn0Qc=
X-Google-Smtp-Source: AGRyM1sD57h5uojh+/L1wjuhlv98TxL+K8mosndGAD8pa+CRdrRPnvwIW9cfsyp8ScA5jAOUVkRv1A==
X-Received: by 2002:a5d:6986:0:b0:21b:8a3d:341b with SMTP id g6-20020a5d6986000000b0021b8a3d341bmr12028066wru.196.1656322758544;
        Mon, 27 Jun 2022 02:39:18 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c? ([2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c])
        by smtp.gmail.com with ESMTPSA id l17-20020a5d5611000000b002101ed6e70fsm9898335wrv.37.2022.06.27.02.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 02:39:18 -0700 (PDT)
Message-ID: <b2c13330-8c03-a08b-19d5-10afc8b28c2c@gmail.com>
Date: Mon, 27 Jun 2022 11:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: How to test meson_gx_pm
Content-Language: en-US
To: =?UTF-8?B?5bygIOWugQ==?= <zhangn1985@outlook.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Nick <nick@khadas.com>, Neil Armstrong <narmstrong@baylibre.com>
References: <OS0P286MB06419BC49795C5CC383B8D75CDB99@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
From: Neil Armstrong <narmstrong.kernel@gmail.com>
In-Reply-To: <OS0P286MB06419BC49795C5CC383B8D75CDB99@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_023922_345323_3B8B7023 
X-CRM114-Status: GOOD (  16.24  )
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

SGksCgpPbiAyNy8wNi8yMDIyIDEwOjUyLCDlvKAg5a6BIHdyb3RlOgo+IEhpLCBOZWlsCj4KPiBJ
IHVuZGVyc3RhbmQgbWVzb25fZ3hfcG0gaXMgcmVqZWN0ZWQgYnkgdXBzdHJlYW1bMF0uCj4KPiBi
dXQgaXQncyBPSyB0byBhZGQgdGhpcyBkcml2ZXIgdG8gcGVyc29uYWwga2VybmVsIGJ1aWxkIG9y
IGRvd25zdHJlYW0ga2VybmVsIGJ1aWxkIGZvciBHWEJCLgo+Cj4gYXMgYSA2IHllYXJzIG9sZCBk
cml2ZXIsIGlzIGl0IHN0aWxsIHdvcmsgYXMgZXhwZWN0ZWQ/CgpObyBpZGVhLCBpdCBzaG91bGQg
YmUgdGVzdGVkLgoKPiBJIGZpbmQgdGhpcyBkcml2ZXIgaGFzIGJlZW4gYWRkZWQgdG8gS2hhZGFz
J3MgbWFpbmxpbmUgbGludXggcmVsZWFzZSBmb3IgeWVhcnMuIGJ1dCB0aGV5IGRpZG4ndCBkbyB0
ZXN0cyB0aGlzIGRyaXZlci4KPgo+IGhvdyB0byB0ZXN0IHRoaXMgZHJpdmVyIGlzIGEgcHJvYmxl
bSBub3cuCj4KPiB0aGUgZHJpdmVyIGlzIGZvciBzdXNwZW5kLCB0aHVzIGNhbiBJIHVzZQo+ICIK
PiAjIGVjaG8gbWVtID4gL3N5cy9wb3dlci9zdGF0ZQo+ICIKPiBmcm9tIGNvbW1hbmQgbGluZT8K
Pgo+IEFuZCBob3cgdG8gd2FrZXVwIGRldmljZT8gcG93ZXIga2V5IG9uIFNCQz8KCkFueSB3YWtl
dXAgc291cmNlIGNvbmZpZ3VyZWQgaW4gYmwzMDEgY29kZSBlbWJlZGVkIGluIHRoZSBGSVAgYm9v
dGFibGUgYmluYXJ5IHNob3VsZCB3b3JrLgoKVXN1YWxseSBCbHVldG9vdGggJiBJUiBhcmUgY29u
ZmlndXJlZCBpbiBhZGRpdGlvbiB0byBhIHBvd2VyIGtleSwgYnV0IHRoZSB2ZW5kb3IgdS1ib290
IHNvdXJjZQoKc2hvdWxkIGJlIGNoZWNrZWQgdG8gY29uZmlybS4KCk5laWwKCj4KPiBCUi4KPiBO
aW5nLgo+Cj4KPiBbMF06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMTQ3ODE4MzM2NS0y
MzcwOC0xLWdpdC1zZW5kLWVtYWlsLW5hcm1zdHJvbmdAYmF5bGlicmUuY29tLwo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKPiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
