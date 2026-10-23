Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638F7606A339
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2026 14:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y9Cfy7ek;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S9yy8vKm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KQA7zI4HEV4jo75hyAAFoYdxIq5Hat3ngfpTm4TKfsY=; b=y9Cfy7ekSK6WWm9Q6vrk64wVQT
	c4LO8+qnbDeYA5yaMk7vJA1NEswUl5vlNDQdzjMhAmKO9RcQTXQpV6OFS/AzO7iKiWv079f/ew73G
	B5UDoLSSWJrqZgWtuh32mYFWu4CidXEmrNvv0d+dLJBHlJC+OMqu2Yy+XqFiSQ+nwFRHleR5QGS1D
	C2qTk8ulB/AzhD2iDbXH4yIMNVWoIssIxUsQAjIdVE6TlsX957jWzZawJMn9IC/kRGEnEo7Vlz4lK
	SParYBkPH56mwTC2khHxTZQKe+iib+SiWj+dTGPW7WNTSbQkApYPWlWrb6hmzkcWfkdjjFV7kb+tB
	F7ZGlkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFqA-0000000GSdB-0aqM;
	Fri, 23 Oct 2026 14:01:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFq8-0000000GSch-0iab
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Oct 2026 14:01:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 43C9D60142;
	Fri, 23 Oct 2026 14:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926BE1F01828;
	Fri, 23 Oct 2026 14:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792764107;
	bh=pMDvcJ/aH4HAGtBAeASTFzR8JI/KqXaCGla6OGwhCJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S9yy8vKmxYUAwzJGuUbnEfBnkIZlgnLL3CS6p6ZgOswB7HyNr+aZplwBTLWxJN6ED
	 kfoCuM8II0hutSNBT4Qob1yZgnLDhcgrFq+WV/99qBuvDXTjjTLV2eaUe61Fsqdzwm
	 81pYU0NZnvdEzY2vfxl2yooxSqh65Db1P9MtAPcrp8JVyTWwarv85+Baep9gpl4pA3
	 n9q7XZ8zDgQ4x/MOsozudKDcjBS03luKmxbTz9jEhV8CQJFJ9DZSTx+hK9Z92u7jog
	 sJDuST7QDGPqJnzNnz6C3NIO2hTsIYKck4z3PXR2KCtLfUgez+dTiRHo2XbMDkjDbF
	 9bGkxTImeA8gg==
Message-ID: <sashiko-outbox-182862@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/9] drm/msm/dp: don't take extra references on
 multiple plug events
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261023-hpd-irq-events-v7-6-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-6-57a3aea3f09e@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:01:46 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGRybS9tc20vZHA6IG1z
bV9kcF9ocGRfcGx1Z19oYW5kbGUoKSBza2lwcyBocGRfaGlnaCBhZnRlciBkZXRlY3QoKQotLQoK
Y29tbWl0IGM2M2M3NTg0Y2UxNjUyNzJhNTg0MGUyYmRkNWY2MThlMmJkMDdkOGYKQXV0aG9yOiBE
bWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+Cgpkcm0v
bXNtL2RwOiBkb24ndCB0YWtlIGV4dHJhIHJlZmVyZW5jZXMgb24gbXVsdGlwbGUgcGx1ZyBldmVu
dHMKClRoaXMgY29tbWl0IHNraXBzIGZ1cnRoZXIgSFBEIHBsdWcgZXZlbnRzIGluIG1zbV9kcF9o
cGRfcGx1Z19oYW5kbGUoKSBpZgpkcC0+cGx1Z2dlZCBpcyBhbHJlYWR5IHNldCwgYXZvaWRpbmcg
ZXh0cmEgcnVudGltZSBQTSByZWZlcmVuY2VzIHVudGlsIGFuCnVucGx1ZyBldmVudCBpcyByZWNl
aXZlZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5j
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMKPiBpbmRleCBmYTg5NDI5MjJi
NTMzLi5jZTkxOWEyNmZiYTI4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAv
ZHBfZGlzcGxheS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMK
PiBAQCAtNDEyLDYgKzQxMiw5IEBAIHN0YXRpYyBpbnQgbXNtX2RwX2hwZF9wbHVnX2hhbmRsZShz
dHJ1Y3QgbXNtX2RwX2Rpc3BsYXlfcHJpdmF0ZSAqZHApCj4gIAo+ICAJZ3VhcmQobXV0ZXgpKCZk
cC0+cGx1Z2dlZF9sb2NrKTsKPiAgCj4gKwlpZiAoZHAtPnBsdWdnZWQpCj4gKwkJcmV0dXJuIDA7
CgpbU2V2ZXJpdHk6IEhpZ2hdCkNhbiB0aGlzIGNhdXNlIG1zbV9kcF9kaXNwbGF5X3Byb2Nlc3Nf
aHBkX2hpZ2goKSB0byBiZSBza2lwcGVkIGFsdG9nZXRoZXIKd2hlbiBtc21fZHBfYnJpZGdlX2Rl
dGVjdCgpIHJ1bnMgYmVmb3JlIG1zbV9kcF9ocGRfcGx1Z19oYW5kbGUoKT8KCkluIGRyaXZlcnMv
Z3B1L2RybS9kaXNwbGF5L2RybV9icmlkZ2VfY29ubmVjdG9yLmMsCmRybV9icmlkZ2VfY29ubmVj
dG9yX2RldGVjdF9jdHgoKSBpbnZva2VzIHRoZSBicmlkZ2UgZGV0ZWN0IGNhbGxiYWNrCmltbWVk
aWF0ZWx5IGJlZm9yZSBub3RpZnlpbmcgSFBEOgoKCWlmIChkZXRlY3QpIHsKCQlzdGF0dXMgPSBk
ZXRlY3QtPmZ1bmNzLT5kZXRlY3QoZGV0ZWN0LCBjb25uZWN0b3IpOwoJCS4uLgoJCWRybV9icmlk
Z2VfY29ubmVjdG9yX2hwZF9ub3RpZnkoY29ubmVjdG9yLCBzdGF0dXMsIERSTV9DT05ORUNUT1Jf
Tk9fRVhUUkFfU1RBVFVTKTsKCX0KCldoZW4gYSBEaXNwbGF5UG9ydCBzaW5rIGlzIGNvbm5lY3Rl
ZCBhbmQgZHJtX2JyaWRnZV9jb25uZWN0b3JfZGV0ZWN0X2N0eCgpCnJ1bnMgKGZvciBleGFtcGxl
IGR1cmluZyBib290LXRpbWUgY29ubmVjdG9yIHByb2JpbmcsIHJlc3VtZSwgb3IKRFJNX0lPQ1RM
X01PREVfR0VUQ09OTkVDVE9SIGJlZm9yZSBhbiBIUEQgaW50ZXJydXB0IGlzIHByb2Nlc3NlZCks
Cm1zbV9kcF9icmlkZ2VfZGV0ZWN0KCkgcmVhZHMgRFBDRCBpbnRvIGEgbG9jYWwgYnVmZmVyIGFu
ZCBzZXRzCnByaXYtPnBsdWdnZWQgPSB0cnVlIHdpdGhvdXQgY2FsbGluZyBtc21fZHBfZGlzcGxh
eV9wcm9jZXNzX2hwZF9oaWdoKCk6CgoJc3RhdHVzID0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0
ZWQ7Cglwcml2LT5wbHVnZ2VkID0gdHJ1ZTsKCldoZW4gZHJtX2JyaWRnZV9jb25uZWN0b3JfaHBk
X25vdGlmeSgpIC0+IG1zbV9kcF9icmlkZ2VfaHBkX25vdGlmeSgpIC0+Cm1zbV9kcF9ocGRfcGx1
Z19oYW5kbGUoKSB0aGVuIHJ1bnMsIG9yIHdoZW4gYSBzdWJzZXF1ZW50IEhQRCBwbHVnIGV2ZW50
CmFycml2ZXMsIHRoaXMgbmV3IGNoZWNrIHNlZXMgZHAtPnBsdWdnZWQgPT0gdHJ1ZSBhbmQgcmV0
dXJucyBlYXJseS4KCkJlY2F1c2UgbXNtX2RwX2Rpc3BsYXlfcHJvY2Vzc19ocGRfaGlnaCgpIGlz
IG5ldmVyIGNhbGxlZCwgTFRUUFIsCmRwLT5wYW5lbC0+bGlua19pbmZvLCBjb25uZWN0b3IgRURJ
RCwgZHAtPmxpbmstPnNpbmtfY291bnQsIGFuZApkcC0+YXVkaW9fc3VwcG9ydGVkIHJlbWFpbiB1
bmluaXRpYWxpemVkLCBjYXVzaW5nIG1zbV9kcF9icmlkZ2VfZ2V0X21vZGVzKCkKdG8gcmV0dXJu
IDAgbW9kZXMsIG1zbV9kcF9kaXNwbGF5X21vZGVfdmFsaWQoKSB0byByZWplY3QgbW9kZXMgd2l0
aApNT0RFX0JBRCwgYW5kIG1zbV9kcF9kaXNwbGF5X3ByZXBhcmVfbGluaygpIHRvIGZhaWwgd2l0
aCAtRU5PVENPTk4uCgpBbHNvLCBhdCB0aGUgZW5kIG9mIG1zbV9kcF9ocGRfcGx1Z19oYW5kbGUo
KToKCglyZXQgPSBtc21fZHBfZGlzcGxheV9wcm9jZXNzX2hwZF9oaWdoKGRwKTsKCS4uLgoJZHAt
PnBsdWdnZWQgPSB0cnVlOwoKCXJldHVybiByZXQ7CgpkcC0+cGx1Z2dlZCBpcyBzZXQgdG8gdHJ1
ZSBldmVuIHdoZW4gbXNtX2RwX2Rpc3BsYXlfcHJvY2Vzc19ocGRfaGlnaCgpCmZhaWxzLCB3aGlj
aCB3aXRoIHRoaXMgZWFybHkgcmV0dXJuIHByZXZlbnRzIHN1YnNlcXVlbnQgSFBEIHBsdWcgZXZl
bnRzCmZyb20gcmV0cnlpbmcgaW5pdGlhbGl6YXRpb24uCgotLSAKU2FzaGlrbyBBSSByZXZpZXcg
wrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDIzLWhwZC1pcnEtZXZlbnRz
LXY3LTAtNTdhM2FlYTNmMDllQG9zcy5xdWFsY29tbS5jb20/cGFydD02CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
