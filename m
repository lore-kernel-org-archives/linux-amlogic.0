Return-Path: <SRS0=pha3=LB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URI_HEX,URI_NOVOWEL,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CD6C47082
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:47:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A23AF60BBB
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A23AF60BBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uhnZ/fyZnIDcMdjAJjNBBwx7FmqvYvtAUsQz2Pefx2s=; b=0oAtYffDjJDm6FrQmpN26G9hIk
	erbO83sblkg308Ed0mV4FoXNiUfZ8pCAsQDZD+QsmT4YnNCdval9L+s3A3fDErA56GgyxSbK8iVWK
	dES4FJibJID1DX1tunEkrRgckHpm1PVCwNLFtNyjnFfI3bHtyizPJCpgUaCJcneIScuvc/oLeNUyK
	PHyL56363M4ggTaqUgsCxKkHGBjDPmGsfytsaxsV1JaEU59IP3WD597Z35etKFYcweG2MC5mRLoNd
	o9/6E5g77xBKC1j4h6600I3YibzZxarvwVPDG7ShXwxHxc/Oazh2ghSw8NXdKa4Ofb5NXjh35xjfu
	bxSdPrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq92Q-001nbX-Jt; Mon, 07 Jun 2021 06:47:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq92M-001nZO-Et
 for linux-amlogic@lists.infradead.org; Mon, 07 Jun 2021 06:47:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id l9so262922wms.1
 for <linux-amlogic@lists.infradead.org>; Sun, 06 Jun 2021 23:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LyNlPC6SvU+YECxldU/+nmnU2jmNOyDHdj+cAyQpUdQ=;
 b=VNnDBdIbSunXj3BlZ20vTALlSHAbmEgZ0P4e7WN+Fz05Uvxt8m8HGXKiGwkzzpCE3X
 CxLs8IjCq+tUrreQj+uBMoejPEv/58BXgxKqa6lq50AKlUNyS6P1jNIujZ2xccnLIjQB
 GpbR0zi83u2ihVdCFzb83nw80R9uvgl8j80kiTE0p+aedodkKd1WONg5u5NVbKXeoQIH
 LPp6uQP4Z13v/g4GMSY667/PUOW0RFxd5IH+8t3L2en+sH2JEaVx5cpFSj1ZnM5oMaFz
 hbQMxetCdXkk9rZfP/S3i9o3PeElGEIa2TagZzlMsfcFu1En6pimn6Ybd5hwo1lUM6Rz
 Maug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LyNlPC6SvU+YECxldU/+nmnU2jmNOyDHdj+cAyQpUdQ=;
 b=hwr9pWug5m6p5F7OOLAVU8PQhOUXw8OXCS6WmhrRXDnSTZGYZytNHDWB3TrQFCluZT
 jGx3Jb+6s+YklaoVg8l3EGbPoA7PPDeu8SEHwmQVREciJcEeaivSG1FiLXSBQaoAVypV
 RR8RdqRAnAVefR1xeQ4sudt2uggqCIe0VhXN+n/Yh9BZ9S78OdQXb9ZY48XeVtFLI4XN
 ANnzkt6is/LUizEsDnkB4bI/ayBnuE+/ghEC/UN8/sNW1WDpa0hdzIt87gDoE9m3ve71
 Hgzi7gMq98Qfj5HBVksU/PwJkSWbVoEqRLxb7n72mWR5PFi1Q4fPfOBfnv2jT4/deFI1
 JPtw==
X-Gm-Message-State: AOAM533OTxpv/AJ6Cs7MZrp6uUA4O47hO1/o12oFCTdJ/RUZnkndcBNi
 Nq+qFAleMpP9AJBqRBL6opLuWQ==
X-Google-Smtp-Source: ABdhPJw5EbYL7clbh4WzOVLWSO8ZoKWq7YxoCQjQVjk/WAJdMjJGM4XQe8l11NIDxs+AOBU4fst2Cg==
X-Received: by 2002:a05:600c:4a09:: with SMTP id
 c9mr15133013wmp.162.1623048419104; 
 Sun, 06 Jun 2021 23:46:59 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:7c1f:1c9f:555e:7398?
 ([2a01:e0a:90c:e290:7c1f:1c9f:555e:7398])
 by smtp.gmail.com with ESMTPSA id l31sm1655289wms.31.2021.06.06.23.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 23:46:58 -0700 (PDT)
Subject: Re: [PATCH] usb: dwc3-meson-g12a: fix usb2 PHY glue init when phy0 is
 disabled
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: balbi@kernel.org, linux-usb@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210601084830.260196-1-narmstrong@baylibre.com>
 <YLoHSJIOSRTyF0r1@kroah.com> <20210604150742.bssvnhm4gv72uw4h@nitro.local>
 <20210604164601.hrlgkrsghhqtho6m@nitro.local>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <66daad75-3340-bc11-1f6f-32bbb0b2e3fa@baylibre.com>
Date: Mon, 7 Jun 2021 08:46:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604164601.hrlgkrsghhqtho6m@nitro.local>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_234703_377761_68EC8375 
X-CRM114-Status: GOOD (  16.02  )
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

T24gMDQvMDYvMjAyMSAxODo0NiwgS29uc3RhbnRpbiBSeWFiaXRzZXYgd3JvdGU6Cj4gT24gRnJp
LCBKdW4gMDQsIDIwMjEgYXQgMTE6MDc6NDJBTSAtMDQwMCwgS29uc3RhbnRpbiBSeWFiaXRzZXYg
d3JvdGU6Cj4+PiBPZGQgdGhhdCBES0lNIGRpZG4ndCB3b3JrIGZvciBiYXlsaWJyZS1jb20sIGJ1
dCBoZXksIEknbGwgdGFrZSBhIHJlYWwKPj4+IHNpZ25hdHVyZSBvdmVyIERLSU0gYW55ZGF5IQo+
Pgo+PiBUaGF0IGxvb2t1cCBoYXBwZW5lZCB0byBncmFiIHRoZSB0aHJlYWQgZnJvbSBsaW51eC1h
bWxvZ2ljLCB3aGljaCBpcwo+PiBtYWlsbWFuMi1tYW5hZ2VkIGFuZCBpcyBrbm93biB0byBicmVh
ayBES0lNLiBJJ2xsIHRyeSB0byBmaXggb3VyIGNvbmZpZ3VyYXRpb24KPj4gc28gdGhhdCBrbm93
bi1ES0lNLWZyaWVuZGx5IHNvdXJjZXMgYXJlIGdpdmVuIHByaW9yaXR5LiBUaGlzIHdheSwgd2hl
biBhIHRocmVhZAo+PiBleGlzdHMgb24gbXVsdGlwbGUgbGlzdHMsIHlvdSdsbCBnZXQgdGhlIG9u
ZSBtb3JlIGxpa2VseSB0byBwYXNzIERLSU0gY2hlY2tzLgo+IAo+IFRoaXMgaXMgbm93IGluIHBs
YWNlIC0tIGxvcmUgd2lsbCBub3cgcHJlZmVyIHJlc3VsdHMgZnJvbSBES0lNLWZyaWVuZGx5Cj4g
c291cmNlcy4gRS5nLiBncmFiYmluZyB0aGUgc2FtZSBtZXNzYWdlLWlkIHdpbGwgbm93IHJldHVy
biB0aGUgdGhyZWFkIGZyb20KPiBsaW51eC11c2IgKHZpYSB2Z2VyKSBpbnN0ZWFkIG9mIGxpbnV4
LWFtbG9naWMgKHZpYSBpbmZyYWRlYWQpLgo+IAo+ICAgICAkIGI0IGFtIC1vL3RtcCAyMDIxMDYw
MTA4NDgzMC4yNjAxOTYtMS1uYXJtc3Ryb25nQGJheWxpYnJlLmNvbQo+ICAgICBMb29raW5nIHVw
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTA2MDEwODQ4MzAuMjYwMTk2LTEtbmFybXN0
cm9uZyU0MGJheWxpYnJlLmNvbQo+ICAgICBHcmFiYmluZyB0aHJlYWQgZnJvbSBsb3JlLmtlcm5l
bC5vcmcvbGludXgtdXNiLzIwMjEwNjAxMDg0ODMwLjI2MDE5Ni0xLW5hcm1zdHJvbmclNDBiYXls
aWJyZS5jb20vdC5tYm94Lmd6Cj4gICAgIEFuYWx5emluZyA0IG1lc3NhZ2VzIGluIHRoZSB0aHJl
YWQKPiAgICAgQ2hlY2tpbmcgYXR0ZXN0YXRpb24gb24gYWxsIG1lc3NhZ2VzLCBtYXkgdGFrZSBh
IG1vbWVudC4uLgo+ICAgICAtLS0KPiAgICAgICDinJMgW1BBVENIXSB1c2I6IGR3YzMtbWVzb24t
ZzEyYTogZml4IHVzYjIgUEhZIGdsdWUgaW5pdCB3aGVuIHBoeTAgaXMgZGlzYWJsZWQKPiAgICAg
ICAgICsgUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGlu
Z2xAZ29vZ2xlbWFpbC5jb20+ICjinJMgREtJTS9nb29nbGVtYWlsLmNvbSkKPiAgICAgICAtLS0K
PiAgICAgICDinJMgU2lnbmVkOiBvcGVucGdwL25hcm1zdHJvbmdAYmF5bGlicmUuY29tCj4gICAg
ICAg4pyTIFNpZ25lZDogREtJTS9iYXlsaWJyZS1jb20uMjAxNTA2MjMuZ2FwcHNzbXRwLmNvbSAo
RnJvbTogbmFybXN0cm9uZ0BiYXlsaWJyZS5jb20pCj4gICAgIC0tLQo+ICAgICBUb3RhbCBwYXRj
aGVzOiAxCj4gICAgIC0tLQo+ICAgICAgTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDIxMDYwMTA4NDgzMC4yNjAxOTYtMS1uYXJtc3Ryb25nQGJheWxpYnJlLmNvbQo+ICAgICAgQmFz
ZTogbm90IGZvdW5kCj4gICAgICAgICAgICBnaXQgYW0gL3RtcC8yMDIxMDYwMV9uYXJtc3Ryb25n
X3VzYl9kd2MzX21lc29uX2cxMmFfZml4X3VzYjJfcGh5X2dsdWVfaW5pdF93aGVuX3BoeTBfaXNf
ZGlzYWJsZWQubWJ4Cj4gCj4gLUsKPiAKCk5pY2UsIHRoYW5rcyBmb3IgdGhpcyAhCgpOZWlsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
