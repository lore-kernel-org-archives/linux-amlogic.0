Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD93C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jan 2022 23:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7xxAplhDHzzwnXhHHvkWDM8Kos8DVwtoCdxCu5O5jg=; b=jFAAmghCOs3oEH
	elKdmKZGi1TM1LzncoUl/F1y/enidtmgJSrYK8JMiWHE2FE5lpkAsXX8PWAx9vna13cBLSkZDDubp
	CYGMucL71Os0NbH8K0LU6UJBYSrgsKzgVxfNcneeHKdkSq449N90tqTNvD50On418/yF//Q9oTfH6
	/bxytBG+DCD1ayLyVx5Qm8Xke5ZyxvGwiTEPgVGfMisoWzFZlN8KjAWMBdYBTm3eIwtwG3zOo4zBa
	75z8dX2xhuvSFvUVtmN4cvZRYqfL1Zp0/KQYefQrBFG0kTPRtoGvz1j+Dtume9uEsnqIGxCbldK+R
	9ZL+5Fa1l+Dn27FpNl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8VZd-00AMzf-HH; Fri, 14 Jan 2022 23:01:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8VZb-00AMz0-Ic; Fri, 14 Jan 2022 23:01:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D38D362051;
 Fri, 14 Jan 2022 23:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EAAC36AE7;
 Fri, 14 Jan 2022 23:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642201290;
 bh=vZ5Dm1SDTdxFpSbc9Jis9bD4bSLl4wKV7rgTTztozS4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=o1EaSxJ54n4kQY6cWvJ8ClkAtAQsziVxlaDFJ3z3ww+SnsVukyi8EHq1b4xoonNKc
 6PnWilX1ldxVpi5Gv1XReD0l/h4Kvq165/oK4ycyvHrHzpHjbBZnr77VhCSE5lXb7m
 EF+giwMMeUVkOErxDPWfvtXSuIxQC6Dd8NNXK5uEzVI7abj/fxW2f2T8QZwcYLEzoc
 35ixf1LhqQ4g+2wNR2Eo3E1ziyh5xi98wrzOPH6tZTpTm4bOeqOPL/SnTXVOxAteh2
 FEcspTwrFFQOWvQZHKtVZqf7LdBSudR6lSZjSYL/dc6reLmXd8l0vAPnzcjRJ1zxEL
 +cto8oXOYYqHA==
MIME-Version: 1.0
In-Reply-To: <09ff9044-9abc-d1ad-26c1-5e6ece56d30c@amlogic.com>
References: <20220113115745.45826-1-liang.yang@amlogic.com>
 <20220113115745.45826-5-liang.yang@amlogic.com>
 <20220113213513.9819AC36AEA@smtp.kernel.org>
 <09ff9044-9abc-d1ad-26c1-5e6ece56d30c@amlogic.com>
Subject: Re: [PATCH v9 4/4] clk: meson: add sub MMC clock controller driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Liang Yang <liang.yang@amlogic.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org
Date: Fri, 14 Jan 2022 15:01:28 -0800
User-Agent: alot/0.10
Message-Id: <20220114230130.35EAAC36AE7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_150131_675867_96606DFA 
X-CRM114-Status: GOOD (  16.17  )
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

UXVvdGluZyBMaWFuZyBZYW5nICgyMDIyLTAxLTEzIDIxOjE0OjQ2KQo+IE9uIDIwMjIvMS8xNCA1
OjM1LCBTdGVwaGVuIEJveWQgd3JvdGU6Cj4gPiBRdW90aW5nIExpYW5nIFlhbmcgKDIwMjItMDEt
MTMgMDM6NTc6NDUpCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL21tYy1jbGtj
LmMgYi9kcml2ZXJzL2Nsay9tZXNvbi9tbWMtY2xrYy5jCj4gPj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiA+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmY1Mzk3N2Y2MTM5MAo+ID4+IC0tLSAvZGV2L251
bGwKPiA+PiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi9tbWMtY2xrYy5jCj4gPj4gQEAgLTAsMCAr
MSwzMDAgQEAKWy4uXQo+ID4+ICsKPiA+PiArc3RhdGljIGludCBtbWNfY2xrY19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4+ICt7Cj4gPj4gKyAgICAgICBzdHJ1Y3QgY2xr
X2h3X29uZWNlbGxfZGF0YSAqb25lY2VsbF9kYXRhOwo+ID4+ICsgICAgICAgc3RydWN0IGRldmlj
ZSAqZGV2ID0gJnBkZXYtPmRldjsKPiA+PiArICAgICAgIHN0cnVjdCBtbWNfY2xrY19kYXRhICpk
YXRhOwo+ID4+ICsgICAgICAgc3RydWN0IHJlZ21hcCAqbWFwOwo+ID4+ICsgICAgICAgc3RydWN0
IGNsa19yZWdtYXAgKmNsaywgKmNvcmU7Cj4gPj4gKyAgICAgICBzdHJ1Y3QgbWVzb25fc2Nsa19k
aXZfZGF0YSAqZGl2X2RhdGE7Cj4gPj4gKwo+ID4+ICsgICAgICAgLypjYXN0IHRvIGRyb3AgdGhl
IGNvbnN0IGluIG1hdGNoLT5kYXRhKi8KPiA+IAo+ID4gU3BhY2UgYWZ0ZXIgKiwgYWxzbyB3aHkg
ZG8gd2UgbmVlZCB0byBjYXN0IGF3YXkgY29uc3Q/IFRoZSB1c2VyIG9mIHRoaXMKPiA+IHBvaW50
ZXIgcGFzc2VzIGl0IGFsbCB0aGUgd2F5IGRvd24gdG8gbW1jX2Nsa2NfcmVnaXN0ZXJfY2xrKCkg
d2hpY2gKPiA+IGNvdWxkIHRha2UgdGhlIGRhdGEgYXMgY29uc3Qgdm9pZCBwb2ludGVyIGFuZCBk
ZWNpZGUgdG8gY2FzdCBhd2F5IGNvbnN0Cj4gPiB0aGVyZS4KPiAKPiBpZiB1c2UgJ2NvbnN0JyBo
ZXJlLCBpdCB3aWxsIHJlcG9ydCBhIHdhcm5pbmc6Cj4gZHJpdmVycy9jbGsvbWVzb24vbW1jLWNs
a2MuYzoyMjQ6NzogZXJyb3I6IGFzc2lnbm1lbnQgZGlzY2FyZHMg4oCYY29uc3TigJkgCj4gcXVh
bGlmaWVyIGZyb20gcG9pbnRlciB0YXJnZQo+IHQgdHlwZSBbLVdlcnJvcj1kaXNjYXJkZWQtcXVh
bGlmaWVyc10gCj4gCj4gICAgZGF0YSA9IChjb25zdCBzdHJ1Y3QgbW1jX2Nsa2NfZGF0YSAqKW9m
X2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwoKT2YgY291cnNlLiBUaGUgdHlwZSBkZWNsYXJh
dGlvbiB1cCBhYm92ZSBuZWVkcyBjb25zdCBhZGRlZCB0byBpdC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
