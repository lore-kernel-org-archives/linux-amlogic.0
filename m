Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F18EC433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 19:23:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 036E22065D
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 19:23:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tGqyV8op"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 036E22065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nWqpMUE8l0N+wZOsFWor0gp5cqQRkmeZipZzTxzXibM=; b=tGqyV8op0WxZkTB6T/XVMOYpm
	WgPMAFSYd0HVli1Bt9CicZRIfNKEyaqIdMMf4VWWjEiiH6z5ub1BfCSt9ivh9MOneGEDi+3nLTh70
	K0CgwERB6M4DyzFs03NYj0RKqWY0kCp6r+2yNtFt/mnqChdzWEojcYeQuC+sTy6lPh/ZOqklhkLk+
	DCaOrPQMBCoDQrJa0Ek3PA/a+Av7hFryUuvipsm0ubcruAJ9h9GJ09+RMUkKjobz6ExeVOZCQ28+p
	k0QdAqlE0SNmcNmD9FwHukOvZB8DtD1wZ45Sp00X1Fm5mtZhri03EgByscWztHDXtrtvqN8eFKLRp
	HbzuoI3aQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jstBl-0004ct-Ta; Tue, 07 Jul 2020 19:23:33 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jstBh-0004bf-Sb; Tue, 07 Jul 2020 19:23:30 +0000
IronPort-SDR: ycY9TLdbZoneH5SI3vKhp+mVXw+ahgpO2i/8kFHgJe9l5ohWxYKzPIkQVgWd52ZXS77aUyz+jI
 LOs1dogVcuqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="209212149"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="209212149"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:23:28 -0700
IronPort-SDR: SXk1Q10/dEw/B/Ix8SBzmmQ/EaXgCGiyRZzY/KFVwafU5RV1QwarZfIx8N5njtxEpEbarCmYED
 AVEqznV6nxUQ==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="266915974"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:23:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: meson: axg-pdm: remove comparison always false
 warning
Date: Tue,  7 Jul 2020 14:23:09 -0500
Message-Id: <20200707192310.98663-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707192310.98663-1-pierre-louis.bossart@linux.intel.com>
References: <20200707192310.98663-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_152330_048082_8CDF2397 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: open list <linux-kernel@vger.kernel.org>, tiwai@suse.de,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Jaroslav Kysela <perex@perex.cz>, Lee Jones <lee.jones@linaro.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Rml4IFc9MSB3YXJuaW5nLgoKc291bmQvc29jL21lc29uL2F4Zy1wZG0uYzogSW4gZnVuY3Rpb24g
4oCYYXhnX3BkbV9zZXRfY2hhbm5lbF9tYXNr4oCZOgppbmNsdWRlL2xpbnV4L2JpdHMuaDoyNjoy
ODogd2FybmluZzogY29tcGFyaXNvbiBvZiB1bnNpZ25lZCBleHByZXNzaW9uCjwgMCBpcyBhbHdh
eXMgZmFsc2UgWy1XdHlwZS1saW1pdHNdCgpjYXN0IHRoZSBjaGFubmVsIG51bWJlciB0byBhbiBp
bnQgdG8gYXZvaWQgY2hlY2tpbmcgaWYgYW4gdW5zaWduZWQKdmFsdWUgaXMgbG93ZXIgdGhhbiB6
ZXJvLgoKU2lnbmVkLW9mZi1ieTogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5i
b3NzYXJ0QGxpbnV4LmludGVsLmNvbT4KLS0tCiBzb3VuZC9zb2MvbWVzb24vYXhnLXBkbS5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvc291bmQvc29jL21lc29uL2F4Zy1wZG0uYyBiL3NvdW5kL3NvYy9tZXNvbi9heGct
cGRtLmMKaW5kZXggYmZkMzdkNDlhNzNlLi44ZmU1YjI1NjM2MTkgMTAwNjQ0Ci0tLSBhL3NvdW5k
L3NvYy9tZXNvbi9heGctcGRtLmMKKysrIGIvc291bmQvc29jL21lc29uL2F4Zy1wZG0uYwpAQCAt
MjA2LDcgKzIwNiw3IEBAIHN0YXRpYyBpbnQgYXhnX3BkbV9zZXRfc2FtcGxlX3BvaW50ZXIoc3Ry
dWN0IGF4Z19wZG0gKnByaXYpCiBzdGF0aWMgdm9pZCBheGdfcGRtX3NldF9jaGFubmVsX21hc2so
c3RydWN0IGF4Z19wZG0gKnByaXYsCiAJCQkJICAgICB1bnNpZ25lZCBpbnQgY2hhbm5lbHMpCiB7
Ci0JdW5zaWduZWQgaW50IG1hc2sgPSBHRU5NQVNLKGNoYW5uZWxzIC0gMSwgMCk7CisJdW5zaWdu
ZWQgaW50IG1hc2sgPSBHRU5NQVNLKChpbnQpY2hhbm5lbHMgLSAxLCAwKTsKIAogCS8qIFB1dCBh
bGwgY2hhbm5lbCBpbiByZXNldCAqLwogCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5tYXAsIFBE
TV9DVFJMLAotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
