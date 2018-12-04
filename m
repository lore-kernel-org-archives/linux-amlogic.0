Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C260BC04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 20:48:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F1DA2081C
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 20:48:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p0m/fthy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="apVfSUwK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F1DA2081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-ID:References:
	In-Reply-To:From:To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDMDuW0mgdUXX2kf0GEvmMcYZPGrnpPGoffpoB+Tox8=; b=p0m/fthyXR3ZQU
	MDkU32+ott4A7V6uz1tplq7EiAvj8xSh5xfWdPc8kqkud0HJA6QyGLnvfOWzwV/ykGSxI4zvAHNF5
	xFodj6ruePKS6SRCIfTlSDrIJYkb5dUmMFzdlKj+YCmDzVky1xC/pRMXYZyXnZu+VnwMmMEPtWmnP
	5kto/t5Dy+horNUpU5tOfvQR/bPxDXQlgnhqYrsmkV/ZZmd+6DxnqplWTngFverNWajMrKlrw3/Vx
	eIIuPuEs+p5pTeZ4oJGojHLOlhVod8K0ZpCHEDGhPn/LNVossiAtsSB7XG1Vm/v1DStr6mvhQYGE0
	tI74Xt316Q+FtPir61GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUHcY-0003mR-Cf; Tue, 04 Dec 2018 20:48:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUHcV-0003kW-Bn
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 20:48:40 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E17012081C;
 Tue,  4 Dec 2018 20:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1543956509;
 bh=OvBgnq+2LA2p+yjrxYv6kkcxJlY2CrrflOhenOOEWgY=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=apVfSUwKhsNa4DY0g0wvy4McqOG68xXVOAt9kZEXBwUUBOjAareqPh09LtKuICbqN
 Cx3O9wd+MWLvk5nXhxvn21OurhSDRsx2RKSq9DeP54DIun/Jxt5aU1T2xM2EdryoER
 zodbzbtiQekhDpef6yVPvijO4kV/mcrkpObTWfH8=
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <2341ec89691f6221bab6a9696ed0c05c3d3de663.camel@baylibre.com>
References: <20181204125839.14505-1-narmstrong@baylibre.com>
 <154394543049.88331.11854270462393390489@swboyd.mtv.corp.google.com>
 <5C06D686.50108@baylibre.com>
 <2341ec89691f6221bab6a9696ed0c05c3d3de663.camel@baylibre.com>
Message-ID: <154395650817.88331.14817295166592104160@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: meson-gxbb: switch video clocks mux tables to static
Date: Tue, 04 Dec 2018 12:48:28 -0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_124839_419126_B8EB7AD5 
X-CRM114-Status: GOOD (  10.44  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

UXVvdGluZyBKZXJvbWUgQnJ1bmV0ICgyMDE4LTEyLTA0IDEyOjA1OjAyKQo+IE9uIFR1ZSwgMjAx
OC0xMi0wNCBhdCAyMDozMyArMDEwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gPiBMZSAwNC8x
Mi8yMDE4IDE4OjQzLCBTdGVwaGVuIEJveWQgYSDDqWNyaXQgOgo+ID4gPiBRdW90aW5nIE5laWwg
QXJtc3Ryb25nICgyMDE4LTEyLTA0IDA0OjU4OjM5KQo+ID4gPiA+IEBAIC0xOTgzLDcgKzE5ODMs
NyBAQCBzdGF0aWMgc3RydWN0IGNsa19maXhlZF9mYWN0b3IgZ3hiYl92Y2xrMl9kaXYxMiA9Cj4g
PiA+ID4gewo+ID4gPiA+ICB9Owo+ID4gPiA+ICAKPiA+ID4gPiAgc3RhdGljIHUzMiBtdXhfdGFi
bGVfY3RzX3NlbFtdID0geyAwLCAxLCAyLCAzLCA0LCA4LCA5LCAxMCwgMTEsIDEyIH07Cj4gPiA+
IAo+ID4gPiBJIHdhcyB0YWxraW5nIGFib3V0IHRoaXMgbXV4X3RhYmxlX2N0c19zZWwgYXJyYXku
IENhbiB0aGlzIGJlIGNvbnN0Pwo+ID4gPiAKPiA+IAo+ID4gT3RoZXIgbXV4IHRhYmxlcyBhcmVu
J3QgY29uc3QsIEplcm9tZSBzbyB5b3Ugc2VlIGEgcmVhc29uIHdoeSB0aGV5IGFyZW4ndAo+ID4g
Y29uc3QgPwo+IAo+IEknbSBzdXJwaXNlZCB3ZSBtaXNzZWQgdGhhdC4gVGhlIFBMTCBwYXJhbXMg
dGFibGVzIG9mIGFtbG9naWMgYXJlIGFsbCAnc3RhdGljCj4gY29uc3QnIGJ1dCBhbGwgdGhlIG11
eCB0YWJsZXMgYXJlIGp1c3QgJ3N0YXRpYycgLCBodW1tCj4gCj4gWy4uLl0gNSBtaW4gbGF0ZXIg
Wy4uLl0KPiAKPiBBY3R1YWxseSB0aGUgdGFibGUgZmllbGQgb2YgY2xrX211eCBpcyBub3QgY29u
c3QsIHNvIGdpdmluZyBpdCBhIGNvbnN0IHRhYmxlCj4gd291bGQgcHJvZHVjZSBhIHdhcm5pbmcg
YWJvdXQgZGlzY2FyZGluZyBjb25zdCBxdWFsaWZpZXIKPiAKPiBJIGd1ZXNzIHRoZXJlIHNob3Vs
ZCBubyBwcm9ibGVtIGFkZGluZyBjb25zdCB0byB0aGUgdGFibGUgZmllbGQgb2Ygc3RydWN0Cj4g
Y2xrX211eC4gV2hhdCBkbyB5b3UgdGhpbmsgU3RlcGhlbiAgPwoKWWVzIGl0IHdvdWxkIG5lZWQg
dG8gYmUgbWFya2VkIGNvbnN0IGluIHRoZSBzdHJ1Y3QgY2xrX211eCBhcyB3ZWxsLiBHbwpmb3Ig
aXQgdG8gbW92ZSBtb3JlIHRoaW5ncyB0byB0aGUgUk8gc2VjdGlvbi4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
