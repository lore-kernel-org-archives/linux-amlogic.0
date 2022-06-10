Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C52C43334
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jun 2022 11:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UT5uT2hv/Q7Ojh48NNNpQq8eyiGTVLdwMYr9XLwEZrM=; b=dPEXXthPvp7ahn
	lNSY883DxvSE3W84oNKQphTjfexRJq64n8szN2glkJsR8cqLmDaOOH3obOjgNd93sKVKKDm3aD4Jl
	w17NQ/PumwBNnNflRoI3LtCjQbGN+lh19Bw/pmuoiCBCsbs2bJBb4wUv7+bKv6IVflPjPF160D2s4
	dn4keZ+vTXZrF2AipcY+Jp92IKZnuU2Y1jje/FtaQtgm7BI13LiQZ9+M3dDB9gLr0v+Br/XKdC8Z+
	1G42IcBPpvRogZ6haPeINP0XNOFSIFNXsw4NT8DcWtrv0QUrkKkz4ZXr+FknQjXHo4WK9IsKbAwjS
	QEPuistOEZH5DO2MHBnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzcWq-007mzb-DJ; Fri, 10 Jun 2022 11:10:12 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzcTC-007kfB-O0; Fri, 10 Jun 2022 11:06:29 +0000
From: Furkan Kardame <f.kardame@manjaro.org>
To: narmstrong@baylibre.com
Cc: khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Furkan Kardame <f.kardame@manjaro.org>
Subject: [PATCH v3] arm64: dts: meson: add gpio-fan control to GS-King-X
Date: Fri, 10 Jun 2022 14:06:09 +0300
Message-Id: <20220610110609.13533-1-f.kardame@manjaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_040626_975369_1F5CE00F 
X-CRM114-Status: UNSURE (   8.22  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

R1MtS2luZy1YIGhhcyBhIHNpbmdsZSBzcGVlZCBHUElPIGZhbiB3aGljaCBpcyBhbHdheXMtb24g
YnkgZGVmYXVsdC4gSWYgd2UgYWRkIGNvbnRyb2xzIGZvciB0aGUgZmFuIGFuZCBhIHRyaXAgcG9p
bnQsIHRoZSBmYW4gc3RheXMgb2ZmIG1vc3Qgb2YgdGhlIHRpbWUsIHJlZHVjaW5nIGJhY2tncm91
bmQgbm9pc2UgZnJvbSB0aGUgdW5pdC4KClNpZ25lZC1vZmYtYnk6IEZ1cmthbiBLYXJkYW1lIDxm
LmthcmRhbWVAbWFuamFyby5vcmc+Ci0tLQpGaXhlZCBzcGVlZC1tYXAgaW5kZW50YXRpb24sIGFs
aWduZWQgYnJhY2tldCwgY2hhbmdlZCBjb29saW5nLWRldmljZSBhbmQgaW5jcmVhc2VkIHRlbXBl
cmF0dXJlIHRvIDcwwrBDCiAuLi4vYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLWdza2luZy14
LmR0cyAgfCAyNSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1n
MTJiLWdza2luZy14LmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJi
LWdza2luZy14LmR0cwppbmRleCA2YzdiZmFjYmEuLjIzNTkyYWUyMSAxMDA2NDQKLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItZ3NraW5nLXguZHRzCisrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLWdza2luZy14LmR0cwpAQCAtMjAs
NiArMjAsMTQgQEAgYWxpYXNlcyB7CiAJCXJ0YzEgPSAmdnJ0YzsKIAl9OwogCisJZ3Bpb19mYW46
IGdwaW8tZmFuIHsKKwkJY29tcGF0aWJsZSA9ICJncGlvLWZhbiI7CisJCWdwaW9zID0gPCZncGlv
IEdQSU9IXzUgR1BJT19BQ1RJVkVfSElHSD47CisJCS8qIFVzaW5nIER1bW15IFNwZWVkICovCisJ
CWdwaW8tZmFuLHNwZWVkLW1hcCA9IDwwIDA+LCA8MSAxPjsKKwkJI2Nvb2xpbmctY2VsbHMgPSA8
Mj47CisJfTsKKwogCWdwaW8ta2V5cy1wb2xsZWQgewogCQljb21wYXRpYmxlID0gImdwaW8ta2V5
cy1wb2xsZWQiOwogCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKQEAgLTk2LDYgKzEwNCwyMyBAQCAm
Y2xrY19hdWRpbyB7CiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAorJmNwdV90aGVybWFsIHsKKwl0
cmlwcyB7CisJCWNwdV9hY3RpdmU6IGNwdS1hY3RpdmUKKwkJCXRlbXBlcmF0dXJlID0gPDcwMDAw
PjsgLyogbWlsbGljZWxzaXVzICovCisJCQloeXN0ZXJlc2lzID0gPDIwMDA+OyAvKiBtaWxsaWNl
bHNpdXMgKi8KKwkJCXR5cGUgPSAiYWN0aXZlIjsKKwkJfTsKKwl9OworCisJY29vbGluZy1tYXBz
IHsKKwkJbWFwIHsKKwkJCXRyaXAgPSA8JmNwdV9hY3RpdmU+OworCQkJY29vbGluZy1kZXZpY2Ug
PSA8JmdwaW9fZmFuIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47CisJCX07CisJ
fTsKK307CisKICZmcmRkcl9hIHsKIAlzdGF0dXMgPSAib2theSI7CiB9OwotLSAKMi4zNi4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
