Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECA9CD4F4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 19:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKWehwGMibANvwD3pXUMwQOOHcAFp5pt3CqZRvA3VRw=; b=mjze2jxysMlqdm
	PmHqynNn2SAWIXf032FwEdP9n6XCqkfO3JDlKlF92HvmOmN/bTnNkn4pyjrKMOOvzS1sA62ZWaccd
	7VjH3YQIzq1Zjt21zqi9rIVxfcrQqb3rHGOI0+mbjVS+yck+hgUCBso8nJirV1rGAvnKsGMbUjDVX
	fxd7MeRVkWpcn7+kycoHSCNfbGOrhmCUGyjDfxEVNX+PTvUv9vPjto/8s3pdEbNjVt9oeT3cvrqrk
	bstjEFbHl55IsYLWUY3iMRcn6Trgcr6PT9LirrLFf8ezmqawAypY+CF0F8Yjy5P7UuonOWd72XSHw
	hUkyisSMbM55tThvrfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3Ha-0000000Gdpr-3qan;
	Mon, 18 May 2026 19:05:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3HX-0000000GdpF-3oeA
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 19:05:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F31040111;
	Mon, 18 May 2026 19:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFA5C2BCB7;
	Mon, 18 May 2026 19:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779131139;
	bh=U6XH6tC9TbZbl9x9IOSGWouoX6yPsjMjQX908wFzbo0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lxTNYU0FQyfbhvhqbqMHWMiCjR6uSgN/tv6QN8WGEdaaPxa+qzEkbDmIUS0I3cX0a
	 kJVMd4jfcLCxIX6FMevjaqhtVqm5Chx2Fvt2Op0IuZQGpv2SyFi2dbipZsOfYuxdAT
	 hXy1OJADCecLULLXSbCqMhaMNWY+m+e5znGZox69nGmk7oWbPCcSWojES48Hz/JSuI
	 D0HO+ApFh66g3Q+1QpbcuuqP58n6QzRuOJrVVaFBGo8W9c6FzMzwVfBB5SqInX+/Pd
	 0+ck3QOpZYXUsODVUWhNOERWnq9LGgiZE+CKjCUuYbuWElzRn1oI4azlZg3ZoDzeqy
	 ugrA/hATWnEuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 18/23] drm: bridge: dw_hdmi: Drop call to
 drm_bridge_hpd_notify()
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260518180206.2480119-19-jonas@kwiboo.se>
References: <20260518180206.2480119-19-jonas@kwiboo.se>
Date: Mon, 18 May 2026 19:05:38 +0000
Message-Id: <20260518190538.BFFA5C2BCB7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_120539_969584_9392DC71 
X-CRM114-Status: GOOD (  10.67  )
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFJlbW92aW5nIGBkcm1f
YnJpZGdlX2hwZF9ub3RpZnkoKWAgdmlvbGF0ZXMgdGhlIGBEUk1fQlJJREdFX09QX0hQRGAgY29u
dHJhY3QgYW5kIHJlcGxhY2VzIHRhcmdldGVkIGJyaWRnZSBIUEQgbm90aWZpY2F0aW9uIHdpdGgg
YW4gaW5lZmZpY2llbnQgZ2xvYmFsIGRldmljZSBwb2xsLgotLQoKY29tbWl0IGYyMjI1ZjBkZTY2
ZWE4MjA1ZGRiZDQ5NTMxYzBjNDAyZGFiMGM3MmIKQXV0aG9yOiBKb25hcyBLYXJsbWFuIDxqb25h
c0Brd2lib28uc2U+Cgpkcm06IGJyaWRnZTogZHdfaGRtaTogRHJvcCBjYWxsIHRvIGRybV9icmlk
Z2VfaHBkX25vdGlmeSgpCgpUaGlzIGNvbW1pdCByZW1vdmVzIHRoZSBjYWxsIHRvIGRybV9icmlk
Z2VfaHBkX25vdGlmeSgpIGZyb20gdGhlIGR3X2hkbWkKaG90cGx1ZyBpbnRlcnJ1cHQgaGFuZGxl
ci4gSXQgcmVsaWVzIGluc3RlYWQgc29sZWx5IG9uCmRybV9oZWxwZXJfaHBkX2lycV9ldmVudCgp
IHRvIHRyaWdnZXIgaG90cGx1ZyBldmVudHMgaW4gb3JkZXIgdG8gcHJldmVudAptdWx0aXBsZSBo
b3RwbHVnIHVldmVudHMgYW5kIHJlZHVuZGFudCBtb2Rlc2V0IHByb2Jlcy4KCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBpbmRleCA1ZGFjYjhhOTk3MTViLi44
YWZjOWQyNDAxMjE0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1o
ZG1pLmMKPiBAQCAtMzEwMSwxMCArMzEwMSw4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBkd19oZG1p
X2lycShpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4gIAkJCXN0YXR1cyA9PSBjb25uZWN0b3Jfc3Rh
dHVzX2Nvbm5lY3RlZCA/Cj4gIAkJCSJwbHVnaW4iIDogInBsdWdvdXQiKTsKPiAgCj4gLQkJaWYg
KGhkbWktPmJyaWRnZS5kZXYpIHsKPiArCQlpZiAoaGRtaS0+YnJpZGdlLmRldikKPiAgCQkJZHJt
X2hlbHBlcl9ocGRfaXJxX2V2ZW50KGhkbWktPmJyaWRnZS5kZXYpOwo+IC0JCQlkcm1fYnJpZGdl
X2hwZF9ub3RpZnkoJmhkbWktPmJyaWRnZSwgc3RhdHVzKTsKPiAtCQl9CgpEb2VzIHJlbW92aW5n
IHRoZSBkcm1fYnJpZGdlX2hwZF9ub3RpZnkoKSBjYWxsIHZpb2xhdGUgdGhlIERSTV9CUklER0Vf
T1BfSFBECkFQSSBjb250cmFjdD8KClRoZSBkd19oZG1pIGRyaXZlciBpcyByZWdpc3RlcmVkIHdp
dGggdGhlIERSTV9CUklER0VfT1BfSFBEIGZsYWcsIHdoaWNoCnR5cGljYWxseSByZXF1aXJlcyB0
aGUgZHJpdmVyIHRvIGNhbGwgZHJtX2JyaWRnZV9ocGRfbm90aWZ5KCkgb24gc3RhdHVzCmNoYW5n
ZXMgc28gdGhhdCByZWdpc3RlcmVkIGNhbGxiYWNrcyBsaWtlIGRybV9icmlkZ2VfY29ubmVjdG9y
X2hwZF9jYigpCmFyZSBwcm9wZXJseSBpbnZva2VkLgoKQnkgcmVseWluZyBzb2xlbHkgb24gZHJt
X2hlbHBlcl9ocGRfaXJxX2V2ZW50KCksIGRvZXNuJ3QgdGhpcyByZXBsYWNlIHRoZQp0YXJnZXRl
ZCBicmlkZ2UgSFBEIG5vdGlmaWNhdGlvbiB3aXRoIGEgZ2xvYmFsIGRldmljZSBwb2xsPwoKTG9v
a2luZyBhdCBkcm1faGVscGVyX2hwZF9pcnFfZXZlbnQoKSBpbiBkcm1fcHJvYmVfaGVscGVyLmMs
IGl0IGFjcXVpcmVzCmRldi0+bW9kZV9jb25maWcubXV0ZXggYW5kIGl0ZXJhdGVzIG92ZXIgYWxs
IGNvbm5lY3RvcnMgb24gdGhlIERSTSBkZXZpY2UsCmNhbGxpbmcgdGhlaXIgZGV0ZWN0KCkgZnVu
Y3Rpb25zIHN5bmNocm9ub3VzbHkuIEluIG11bHRpLWRpc3BsYXkgc3lzdGVtcwooZm9yIGV4YW1w
bGUsIEhETUkgYWxvbmdzaWRlIGVEUCBvciBEU0kpLCB3aWxsIGFuIEhETUkgaG90cGx1ZyBpbnRl
cnJ1cHQKbm93IHRyaWdnZXIgc2xvdyBEREMvSTJDL0FVWCBwcm9iZXMgb24gdGhvc2UgY29tcGxl
dGVseSB1bnJlbGF0ZWQgY29ubmVjdG9ycz8KCldoaWxlIGxhdGVyIHBhdGNoZXMgb3IgZGlzY3Vz
c2lvbnMgbWlnaHQgYWRkcmVzcyB1c2luZyBkZWxheWVkX3dvcmsgdG8gZGVib3VuY2UKaG90cGx1
ZyBldmVudHMgdG8gYXZvaWQgbXV0ZXggZGVhZGxvY2tzLCBjb3VsZCB0aGUgZHJpdmVyIHJlc29s
dmUgdGhvc2UgbG9ja2luZwppc3N1ZXMgd2l0aG91dCBieXBhc3NpbmcgdGhlIGJyaWRnZSBmcmFt
ZXdvcmsncyB0YXJnZXRlZCBub3RpZmljYXRpb24gbWVjaGFuaXNtCmFuZCBmb3JjaW5nIGFuIGlu
ZWZmaWNpZW50IGdsb2JhbCBwb2xsPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUxODE4MDIwNi4yNDgwMTE5LTEtam9uYXNAa3dp
Ym9vLnNlP3BhcnQ9MTgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
