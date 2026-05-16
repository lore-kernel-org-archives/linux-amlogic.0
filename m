Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A5BCD4851
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 May 2026 19:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDwV3pubiPC5lOWaK0k3dyINGZsHa23+PhJQqNv5+cY=; b=SUIwu+h74xHs+t
	bOx64++2OJ53FHTShQTycqFvgsR+9jUIhk1JRLkXGZjb1LtPCdUgVKZveYV5LS/fJnEryP+VcMKmE
	VBnOgE8CY9xDTwa+U69HrW9XETEPdedmZy2HEWVEAYFwE9/UeTT1VIazG2IzIc7qN1oqRl+rX/IQq
	6SaXFSgm8gx3Nvx+6dIRcv7BPakMXl7I8IusipAQ6K2FkqI+cS+/AKLrzw2HXZ1fQf+NWvPPC36/b
	CgQERyMGWHiSHQJgv7SwuIwRfaj5uLGWpRRmSAYHAobv5m5oImLfmglduUUYfpA54rf4VKpGWopJP
	Xx/x5OivxC8Sq5dgUmew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKgx-0000000BN9W-2CWj;
	Sat, 16 May 2026 19:28:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKgv-0000000BN8c-0ZVK
	for linux-amlogic@lists.infradead.org;
	Sat, 16 May 2026 19:28:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D8FB43B8C;
	Sat, 16 May 2026 19:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F9CC19425;
	Sat, 16 May 2026 19:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778959730;
	bh=kdNY2alaMStejlo6KBLA3Br+ap4kunbgPI48PZpoaHc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Mj6/5EVW606TCWotv6XzApLqVDcjnwBiyo+suiQ4rw8F6LxQGrGNnrIH3U8wvNTwU
	 tUbshkHDVRSALIFbJBU/pX/3uDypHEgXVvY3h54UXNOyFPs+LR6eQ2TxuTuLwGzM4f
	 pNFllqexVagUVKfzLtdji0R7PQngXRJEoCCufv4Mv1V2UHhoN4/05tdOZwrt1aNCLk
	 JLj9yKLM6OKHVbYAoZPWD5HuPw9j9vnqzyaTeD5nFK1fp93kFm/yhBpObnTIGom98j
	 Gxr3RtO1CFyYkXBkoLB24yLnbS1hGZU+hJkijM7k1jSn7656maPbZXybDCsIPSBUSf
	 QHnBPooXw6Vmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/22] drm: bridge: dw_hdmi: Unregister CEC notifier
 during connector cleanup
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260516183838.2024991-9-jonas@kwiboo.se>
References: <20260516183838.2024991-9-jonas@kwiboo.se>
Date: Sat, 16 May 2026 19:28:49 +0000
Message-Id: <20260516192849.E0F9CC19425@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_122853_220957_AAE62E0A 
X-CRM114-Status: GOOD (  12.91  )
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIE1vdmluZyBgY2VjX25v
dGlmaWVyX2Nvbm5fdW5yZWdpc3RlcmAgdG8gdGhlIGNvbm5lY3RvcidzIGAuZGVzdHJveWAgY2Fs
bGJhY2sgaW50cm9kdWNlcyBhbiBhc3luY2hyb25vdXMgc3RhdGUgY29ycnVwdGlvbiB2dWxuZXJh
YmlsaXR5LCBicmVha2luZyBDRUMgZnVuY3Rpb25hbGl0eSBvbiBkcml2ZXIgcmViaW5kLgotLQoK
Y29tbWl0IDhjNWYxZDUyOWFkYjNhOTE2OTZkMWU2MjRhMGIzZGMzMWQ1Mjg3YmEKQXV0aG9yOiBK
b25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+CmRybTogYnJpZGdlOiBkd19oZG1pOiBVbnJl
Z2lzdGVyIENFQyBub3RpZmllciBkdXJpbmcgY29ubmVjdG9yIGNsZWFudXAKClRoaXMgY29tbWl0
IG1vdmVzIHRoZSBjZWNfbm90aWZpZXJfY29ubl91bnJlZ2lzdGVyIGNhbGwgZnJvbSB0aGUgYnJp
ZGdlCmRldGFjaCBmdW5jdGlvbiB0byB0aGUgY29ubmVjdG9yIGRlc3Ryb3kgZnVuY3Rpb24uIFRo
aXMgaXMgaW50ZW5kZWQgdG8gYWxpZ24KdGhlIGxpZmV0aW1lIG9mIHRoZSBjb25uZWN0b3IgYW5k
IHRoZSBDRUMgbm90aWZpZXIuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS5jCj4gaW5kZXggY2JiZDE1NTc4MDQyNS4uNWZkMjZmZjhmNTViNCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gQEAgLTI1MzIsNiArMjUzMiwx
MSBAQCBzdGF0aWMgdm9pZCBkd19oZG1pX2Nvbm5lY3Rvcl9kZXN0cm95KHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IpCj4gIHsKPiAgCXN0cnVjdCBkd19oZG1pICpoZG1pID0gY29udGFp
bmVyX29mKGNvbm5lY3Rvciwgc3RydWN0IGR3X2hkbWksIGNvbm5lY3Rvcik7Cj4gIAo+ICsJbXV0
ZXhfbG9jaygmaGRtaS0+Y2VjX25vdGlmaWVyX211dGV4KTsKPiArCWNlY19ub3RpZmllcl9jb25u
X3VucmVnaXN0ZXIoaGRtaS0+Y2VjX25vdGlmaWVyKTsKCkNvdWxkIHRoaXMgY2F1c2Ugc3RhdGUg
Y29ycnVwdGlvbiBpZiBhIHVzZXIgaG9sZHMgdGhlIERSTSBmaWxlIGRlc2NyaXB0b3IKb3BlbiBh
Y3Jvc3MgYSBkcml2ZXIgdW5iaW5kL2JpbmQgY3ljbGU/CgpCZWNhdXNlIHRoZSBjb25uZWN0b3Ig
ZGVzdHJveSBjYWxsYmFjayBydW5zIGFzeW5jaHJvbm91c2x5IHdoZW4gdGhlIGxhc3QgRFJNCmZp
bGUgZGVzY3JpcHRvciBpcyBjbG9zZWQsIGl0cyBleGVjdXRpb24gY2FuIGJlIGRlbGF5ZWQgaW5k
ZWZpbml0ZWx5LgoKSWYgdGhlIGRyaXZlciBpcyB1bmJvdW5kIGFuZCB0aGVuIHJlYm91bmQgd2hp
bGUgdGhlIG9sZCBmaWxlIGRlc2NyaXB0b3IgaXMKc3RpbGwgb3BlbiwgYSBuZXcgZHdfaGRtaSBp
cyBhbGxvY2F0ZWQgYW5kIGEgbmV3IGNvbm5lY3RvciBpcyBjcmVhdGVkLiBXaGVuCmNlY19ub3Rp
Zmllcl9jb25uX3JlZ2lzdGVyIGlzIGNhbGxlZCBvbiByZWJpbmQsIGl0IGxvb2tzIHVwIHRoZSBu
b3RpZmllciBieQp0aGUgcGh5c2ljYWwgZGV2aWNlIChoZG1pLT5kZXYpIGFuZCBzaGFyZXMgdGhl
IGV4YWN0IHNhbWUgY2VjX25vdGlmaWVyIHdpdGgKdGhlIG5ldyBhY3RpdmUgcGlwZWxpbmUuCgpX
aGVuIHRoZSB1c2VyIGV2ZW50dWFsbHkgY2xvc2VzIHRoZSBvbGQgZmlsZSBkZXNjcmlwdG9yLCB0
aGUgb2xkIGNvbm5lY3RvcidzCmRlc3Ryb3kgY2FsbGJhY2sgd2lsbCBmaXJlIGFuZCBjYWxsIGNl
Y19ub3RpZmllcl9jb25uX3VucmVnaXN0ZXIuIFRoaXMgd2lsbApjbGVhciB0aGUgY29ubmVjdGlv
biBpbmZvIGFuZCBpbnZhbGlkYXRlIHRoZSBwaHlzaWNhbCBhZGRyZXNzLCB3aGljaCB3b3VsZApk
ZXN0cm95IHRoZSBhY3RpdmUgQ0VDIHN0YXRlIG9mIHRoZSBuZXdseSBib3VuZCBkaXNwbGF5IHBp
cGVsaW5lLgoKU2hvdWxkIGhhcmR3YXJlLWNvdXBsZWQgc3RhdGUgbGlrZSB0aGUgQ0VDIG5vdGlm
aWVyIGJlIGludmFsaWRhdGVkIGF0CmhhcmR3YXJlIGJvdW5kYXJpZXMgbGlrZSBkZXRhY2gsIHJh
dGhlciB0aGFuIHNvZnR3YXJlIHJlZmNvdW50IGJvdW5kYXJpZXMKbGlrZSBkZXN0cm95PwoKPiAr
CWhkbWktPmNlY19ub3RpZmllciA9IE5VTEw7Cj4gKwltdXRleF91bmxvY2soJmhkbWktPmNlY19u
b3RpZmllcl9tdXRleCk7Cj4gKwo+ICAJZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwKGNvbm5lY3Rvcik7
Cj4gIAlkcm1fYnJpZGdlX3B1dCgmaGRtaS0+YnJpZGdlKTsKPiAgfQoKWyAuLi4gXQoKLS0gClNh
c2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUx
NjE4MzgzOC4yMDI0OTkxLTEtam9uYXNAa3dpYm9vLnNlP3BhcnQ9OAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
