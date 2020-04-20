Return-Path: <SRS0=tbsV=6E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12966C3815B
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 16:10:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAB3E20775
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 16:10:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S9YdYfO3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BW+UrLUt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAB3E20775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12f7UpaycARwneGN09sIbd5IMhW5NXS2063bDVyNx/w=; b=S9YdYfO3VVlHhK
	i5d4CttuGj+oMSwZ5EZ+1VbTsdYRk1SuqTbWjTK3pc5rRlao/FzvO3v+7ktwxfBauV+jP/zs549/B
	tbKKcSlNYomUUSOZiBVhEWLMVsGEDC7PV6WY42bQls63xgRWs2fKmeShVRZNgs+cxCqOEl8JRUQaB
	K5XrvbIOYsKdHHq6xvotz7IeOIEksnGGvzSCC4JJI5uIc/4rmbmz4+LsCeSzkOBeVzZqaYeczdEUB
	zwsKigL46sV0BSClnmisU2kDPlRIyPTu2juD8jBBQmz2bcPqNmnMLg6NQXj/sWIJqG+YQYTGvaqK8
	jPUImNREJd+B4+bxrNvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQZ0U-0005fB-Cc; Mon, 20 Apr 2020 16:10:50 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQZ0I-0005Qq-Cj
 for linux-amlogic@lists.infradead.org; Mon, 20 Apr 2020 16:10:40 +0000
Received: by mail-vs1-xe43.google.com with SMTP id g184so6386114vsc.0
 for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2020 09:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qpi0J/WbUvWdEolbQKeQDKkPShB1LtnL6nCqIWc36DY=;
 b=BW+UrLUtrSDOWpQ96lKroLpJ0GwsHePk7gEl2qvro7DvnBAyWbLfxdYVxN7FfnDeCx
 uJflNPa99uT59gx0fkK578RAV2OBPkTQPj6JK+HLaXtjY51SSK7Kn8qaxH5CDXKgnC6j
 IPm+O7QSpNLXbY2QCSjbrdWF1Yu6vCqNvXsTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qpi0J/WbUvWdEolbQKeQDKkPShB1LtnL6nCqIWc36DY=;
 b=cy+yjgIGaoV0zICBHGrVZ2AzgokEB9qfQkTlEJ6V2QL7JXx78jzs7ikqUG0Uul4xSE
 oY0ACnQgms48hevoAYgszYjfS4U8R8bGXSBabEpL0Mu9lhnT9zFGn7SJRfGpvKLPtqLf
 13TsxUa/htNVx9TUIgX0KPizrDsW3xo0j5a5HMK2pD/mwod2vq+K7c6azpsTWJWhkPSL
 Oc7IHrOyZWFR2VRT00JiUFYK9B0DEfl76NPqoEi+KJFrKB01W4JK+ee/DEwK7M9OrogU
 C7lA4olPO00xL/+2h47XWm/dUsaD7fNV4GInlP/ET0E/oTk5O4WMK0Ll+31vFS5a4KST
 3TLw==
X-Gm-Message-State: AGi0Pua2zWNQg1mL5z66vEWeheqRl55U1Yaj4baBIL91YJ/bBKuJEBgF
 pS6JGXVGh4MNG5rJd4LKzxyvkOB6QHlY0Npx3TDvWA==
X-Google-Smtp-Source: APiQypIhS53Wee3RsQbe8vsxG5wUcME+kVwG3CPn5YmAWHWxOSWNCLky0Dv3AKwNMcB18Ggu9pPBfR5XmDGTQ6pv/Dk=
X-Received: by 2002:a67:d998:: with SMTP id u24mr12522181vsj.93.1587399036183; 
 Mon, 20 Apr 2020 09:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <F208C554-13FE-4943-9DA0-21A280E0DB09@gmail.com>
In-Reply-To: <F208C554-13FE-4943-9DA0-21A280E0DB09@gmail.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Mon, 20 Apr 2020 09:10:22 -0700
Message-ID: <CANFp7mWHAig=f+6iZbum0xnHA7-32LNmoY94n=wwhMkYYoNF=A@mail.gmail.com>
Subject: Re: How to handle different operating speed for QCA9377 SDIO BT
 module?
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_091038_463139_59367F6F 
X-CRM114-Status: GOOD (  16.74  )
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
Cc: Bluez mailing list <linux-bluetooth@vger.kernel.org>,
 ath10k@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0aWFuLAoKTG9va3MgbGlrZSB0aGUgbWF4LXNwZWVkIHNldHRpbmcgaXMgaW5zaWRl
IGFuIGlmIGJsb2NrIGFuZCB0aGF0IG1pZ2h0CmJlIHdoeSB5b3UncmUgbm90IGFibGUgdG8gc2V0
IGl0CihodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxhbWUvbWFzdGVyL2RyaXZl
cnMvYmx1ZXRvb3RoL2hjaV9xY2EuYyNMMTg5MikuCkkgd291bGQgc3VnZ2VzdCBtb3ZpbmcgdGhh
dCBvdXRzaWRlIHRoZSBpZiBibG9jayBhbmQgdHJ5aW5nIGFnYWluLgoKQWJoaXNoZWsKCk9uIE1v
biwgQXByIDIwLCAyMDIwIGF0IDE6NTEgQU0gQ2hyaXN0aWFuIEhld2l0dAo8Y2hyaXN0aWFuc2hl
d2l0dEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gUmVzZW5kIHRvIGV4cGFuZCB0aGUgYXVkaWVuY2Ug
YW5kIGluY2x1ZGUgdGhlIGxpbnV4LWFtbG9naWMgYW5kIGF0aDEwayBsaXN0cy4KPgo+ID4+Pj4+
Cj4KPiBJ4oCZbSB3b3JraW5nIHdpdGggYSBRQ0E5MzM3IFNESU8gZGV2aWNlIG9uIGFuIEFuZHJv
aWQgKG5vdyBMaW51eCkgc2V0LXRvcCBib3ggd2l0aCBhbiBBbWxvZ2ljIFM5MDVEIFNvQy4KPgo+
IFNESU8gV2lGaSAoYXRoMTBrKSBpcyB3b3JraW5nIHNpbmNlIDUuNy1yYzEsIGJ1dCB0aGUgQlQg
c2lkZSBvZiB0aGUgbW9kdWxlIGlzIHN0aWxsIG1pc3NpbmcuCj4KPiBNb3N0IEFtbG9naWMgZGV2
aWNlcyAoOTUlKykgdXNlIEJyb2FkY29tIFNESU8gbW9kdWxlcyB3aXRoIHRoZSBmb2xsb3dpbmcg
ZGV2aWNlIHRyZWUgY29udGVudDoKPgo+ICZ1YXJ0X0Egewo+ICAgICAgICAgYmx1ZXRvb3RoIHsK
PiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJicmNtLGJjbTQzNDM4LWJ0IjsKPiAgICAg
ICAgICAgICAgICAgc2h1dGRvd24tZ3Bpb3MgPSA8JmdwaW8gR1BJT1hfMTcgR1BJT19BQ1RJVkVf
SElHSD47Cj4gICAgICAgICAgICAgICAgIG1heC1zcGVlZCA9IDwyMDAwMDAwPjsKPiAgICAgICAg
ICAgICAgICAgY2xvY2tzID0gPCZ3aWZpMzJrPjsKPiAgICAgICAgICAgICAgICAgY2xvY2stbmFt
ZXMgPSAibHBvIjsKPiAgICAgICAgIH07Cj4gfTsKPgo+IEkgY2hhbmdlZCB0aGUgY29tcGF0aWJs
ZSB0byAicWNvbSxxY2E5Mzc3LWJ04oCdIGFuZCBhcHBsaWVkIHRoZSBmb2xsb3dpbmcgcGF0Y2g6
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibHVldG9vdGgvaGNpX3FjYS5jIGIvZHJpdmVycy9i
bHVldG9vdGgvaGNpX3FjYS5jCj4gaW5kZXggNDM5MzkyYjFjMDQzLi42ZjAzNTBmYmRjZDYgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ibHVldG9vdGgvaGNpX3FjYS5jCj4gKysrIGIvZHJpdmVycy9i
bHVldG9vdGgvaGNpX3FjYS5jCj4gQEAgLTIwNDYsNiArMjA0Niw3IEBAIHN0YXRpYyBTSU1QTEVf
REVWX1BNX09QUyhxY2FfcG1fb3BzLCBxY2Ffc3VzcGVuZCwgcWNhX3Jlc3VtZSk7Cj4KPiBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBxY2FfYmx1ZXRvb3RoX29mX21hdGNoW10gPSB7
Cj4gICAgICAgIHsgLmNvbXBhdGlibGUgPSAicWNvbSxxY2E2MTc0LWJ0IiB9LAo+ICsgICAgICAg
eyAuY29tcGF0aWJsZSA9ICJxY29tLHFjYTkzNzctYnQiIH0sCj4gICAgICAgIHsgLmNvbXBhdGli
bGUgPSAicWNvbSx3Y24zOTkwLWJ0IiwgLmRhdGEgPSAmcWNhX3NvY19kYXRhX3djbjM5OTB9LAo+
ICAgICAgICB7IC5jb21wYXRpYmxlID0gInFjb20sd2NuMzk5MS1idCIsIC5kYXRhID0gJnFjYV9z
b2NfZGF0YV93Y24zOTkxfSwKPiAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJxY29tLHdjbjM5OTgt
YnQiLCAuZGF0YSA9ICZxY2Ffc29jX2RhdGFfd2NuMzk5OH0sCj4KPiBUaGlzIHJlc3VsdHMgaW4g
cHJvYmluZyB3aXRoIGVycm9yczogaHR0cDovL2l4LmlvLzJpNlAKPgo+IEkgbm90aWNlZCAibWF4
LXNwZWVkID0gPDIwMDAwMDA+O+KAnSB3aGlsZSBoY2lfcWNhLmMgc2V0cyAzMDAwMDAwLiBJIGF0
dGVtcHRlZCB0byBzZXQgIm1heC1zcGVlZCA9IDwzMDAwMDAwPjvigJ0gYnV0IHRoaXMgbWFkZSBu
byBkaWZmZXJlbmNlLCBzbyBJIHBhdGNoZWQgYSBsb3dlciB2YWx1ZSBpbiBoY2lfcWNhOgo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmx1ZXRvb3RoL2hjaV9xY2EuYyBiL2RyaXZlcnMvYmx1ZXRv
b3RoL2hjaV9xY2EuYwo+IGluZGV4IDZmMDM1MGZiZGNkNi4uYjdlYTFlOWY0OTA0IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2hjaV9xY2EuYwo+ICsrKyBiL2RyaXZlcnMvYmx1ZXRv
b3RoL2hjaV9xY2EuYwo+IEBAIC0xNjc4LDcgKzE2NzgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGhjaV91YXJ0X3Byb3RvIHFjYV9wcm90byA9IHsKPiAgICAgICAgLm5hbWUgICAgICAgICAgID0g
IlFDQSIsCj4gICAgICAgIC5tYW51ZmFjdHVyZXIgICA9IDI5LAo+ICAgICAgICAuaW5pdF9zcGVl
ZCAgICAgPSAxMTUyMDAsCj4gLSAgICAgICAub3Blcl9zcGVlZCAgICAgPSAzMDAwMDAwLAo+ICsg
ICAgICAgLm9wZXJfc3BlZWQgICAgID0gMjAwMDAwMCwKPiAgICAgICAgLm9wZW4gICAgICAgICAg
ID0gcWNhX29wZW4sCj4gICAgICAgIC5jbG9zZSAgICAgICAgICA9IHFjYV9jbG9zZSwKPiAgICAg
ICAgLmZsdXNoICAgICAgICAgID0gcWNhX2ZsdXNoLAo+Cj4gVGhpcyByZXN1bHRzIGluIGFuIGF0
dGVtcHQgdG8gbG9hZCBmaXJtd2FyZSwgc2VlOiBodHRwOi8vaXguaW8vMmk2USBhbmQgdXNpbmcg
cmVuYW1lZCBmaWxlcyBmcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9ib3VuZGFyeWRldmljZXMvcWNh
LWZpcm13YXJlL3RyZWUvYmQtc2RtYWMtYXRoMTBrL3FjYSB0aGUgbW9kdWxlIGlzIG5vdyBvdGhl
cndpc2UgdXAvd29ya2luZyAtIEkgY2FuIHNjYW4vc2VlL3BhaXIgb3RoZXIgQlQgZGV2aWNlcy4K
Pgo+IHNlZTogaHR0cDovL2l4LmlvLzJpNlMgYW5kOgo+Cj4gU01MNTQ0MlRXOn4gIyBibHVldG9v
dGhjdGwgc2hvdwo+IENvbnRyb2xsZXIgOTE6MDg6MDA6MDA6MDA6MDAgKHB1YmxpYykKPiAgICAg
ICAgIE5hbWU6IFNNTDU0NDJUVwo+ICAgICAgICAgQWxpYXM6IFNNTDU0NDJUVwo+ICAgICAgICAg
Q2xhc3M6IDB4MDAwYzAwMDAKPiAgICAgICAgIFBvd2VyZWQ6IHllcwo+ICAgICAgICAgRGlzY292
ZXJhYmxlOiBubwo+ICAgICAgICAgRGlzY292ZXJhYmxlVGltZW91dDogMHgwMDAwMDBiNAo+ICAg
ICAgICAgUGFpcmFibGU6IHllcwo+ICAgICAgICAgVVVJRDogQXVkaW8gU291cmNlICAgICAgICAg
ICAgICAoMDAwMDExMGEtMDAwMC0xMDAwLTgwMDAtMDA4MDVmOWIzNGZiKQo+ICAgICAgICAgVVVJ
RDogR2VuZXJpYyBBdHRyaWJ1dGUgUHJvZmlsZSAoMDAwMDE4MDEtMDAwMC0xMDAwLTgwMDAtMDA4
MDVmOWIzNGZiKQo+ICAgICAgICAgVVVJRDogR2VuZXJpYyBBY2Nlc3MgUHJvZmlsZSAgICAoMDAw
MDE4MDAtMDAwMC0xMDAwLTgwMDAtMDA4MDVmOWIzNGZiKQo+ICAgICAgICAgVVVJRDogUG5QIElu
Zm9ybWF0aW9uICAgICAgICAgICAoMDAwMDEyMDAtMDAwMC0xMDAwLTgwMDAtMDA4MDVmOWIzNGZi
KQo+ICAgICAgICAgVVVJRDogQS9WIFJlbW90ZSBDb250cm9sIFRhcmdldCAoMDAwMDExMGMtMDAw
MC0xMDAwLTgwMDAtMDA4MDVmOWIzNGZiKQo+ICAgICAgICAgVVVJRDogQS9WIFJlbW90ZSBDb250
cm9sICAgICAgICAoMDAwMDExMGUtMDAwMC0xMDAwLTgwMDAtMDA4MDVmOWIzNGZiKQo+ICAgICAg
ICAgVVVJRDogQXVkaW8gU2luayAgICAgICAgICAgICAgICAoMDAwMDExMGItMDAwMC0xMDAwLTgw
MDAtMDA4MDVmOWIzNGZiKQo+ICAgICAgICAgTW9kYWxpYXM6IHVzYjp2MUQ2QnAwMjQ2ZDA1MzYK
PiAgICAgICAgIERpc2NvdmVyaW5nOiBubwo+IEFkdmVydGlzaW5nIEZlYXR1cmVzOgo+ICAgICAg
ICAgQWN0aXZlSW5zdGFuY2VzOiAweDAwCj4gICAgICAgICBTdXBwb3J0ZWRJbnN0YW5jZXM6IDB4
MDUKPiAgICAgICAgIFN1cHBvcnRlZEluY2x1ZGVzOiB0eC1wb3dlcgo+ICAgICAgICAgU3VwcG9y
dGVkSW5jbHVkZXM6IGFwcGVhcmFuY2UKPiAgICAgICAgIFN1cHBvcnRlZEluY2x1ZGVzOiBsb2Nh
bC1uYW1lCj4KPiBTbyBpdCBsb29rcyBsaWtlIGhjaV9xY2EuYyBuZWVkcyBtb2RpZmljYXRpb24g
dG8gaGFuZGxlIG11bHRpcGxlIG9wZXJhdGluZyBzcGVlZHMsIHBlcmhhcHMgdXNpbmcgdGhlIG1h
eC1zcGVlZCBkZXNjcmlwdGlvbiBmcm9tIGRldmljZS10cmVlIGlmIGF2YWlsYWJsZSwgb3IgZGVm
YXVsdGluZyB0byB0aGUgY3VycmVudCAzMDAwMDAwIHZhbHVlIGlmIG5vdC4KPgo+IEnigJltIG5v
dCBhIGNvZGluZyBkZXZlbG9wZXIgc28gaWYgc29tZW9uZSBjYW4gc3VnZ2VzdCBhIHBhdGNoIC0g
SSBjYW4gdGVzdCBhbmQgY29uZmlybSBpdCB3b3Jrcy4gT3IgaWYgc29tZW9uZSBjYW4gZXhwbGFp
biBob3cgdGhpcyBzaG91bGQgYmUgaW1wbGVtZW50ZWQgSSB3aWxsIHNlZSBpZiBJIGNhbiBmaW5k
IHNvbWVvbmUgdG8gaGVscCB3aXRoIHRoZSB0YXNrLgo+Cj4gQ2hyaXN0aWFuCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
