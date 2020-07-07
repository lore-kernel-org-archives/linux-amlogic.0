Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD3FC433E1
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 19:23:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 023692065D
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 19:23:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vEm1/N2U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 023692065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gkLo7+F2IgqRKMfR8IxcD+ApvnDLDZrZFC20Mmw2Foo=; b=vEm1/N2UqM1AIFkX6XgkAkdti
	Ua35ld24vZlNQC7JlrGLh85cjbA+PtPw4R0yRWHn9nBznFlFPQdB8Kjx5ymLJcQ8TaoNXbscXwIUx
	x8wfoXq5fzD6WzVGBc6BsT6cR25hmnXBlrGblAA9q3f9q/B8S5sNkry0nNbrqYqRgCXzySZZiyss4
	bURdfzFYVfkA6uH+LLed+CWiJNF4ug9xm0gzTR+HsAsDrL1pP4hcrW3egppUVTpWjkouKqCwKwj1O
	RUWewiuith8/pK02gDzZVr+MAiqXewNH5z50rdPY2s6BvpVvg5bZ3D1XPSfdzuR1mPR1WFZokNJ/X
	zlBTGSGhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jstBp-0004dj-KU; Tue, 07 Jul 2020 19:23:37 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jstBi-0004bq-Jc; Tue, 07 Jul 2020 19:23:31 +0000
IronPort-SDR: MX/5i4tsc/PCs0flx3WO8J3j4cJJ6GIuNBN9pPICTETpyMI9AMnXzB3cCHCfbRi/Bsiim0Yhxm
 5ujlZ5gE5sqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="209212154"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="209212154"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:23:29 -0700
IronPort-SDR: K33tZHbvjJJz+antiIUzSPM8PCsbQXC/0det2ssOH3Ql+QVJxbrxSEX7yRQ07VjmGga7TrT+CC
 VjVS0Z0i/9qg==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="266915978"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:23:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: meson: axg-spdifin: remove comparison always false
 warning
Date: Tue,  7 Jul 2020 14:23:10 -0500
Message-Id: <20200707192310.98663-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707192310.98663-1-pierre-louis.bossart@linux.intel.com>
References: <20200707192310.98663-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_152330_785353_210018E8 
X-CRM114-Status: GOOD (  10.48  )
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

Rml4IFc9MSB3YXJuaW5nOgoKc291bmQvc29jL21lc29uL2F4Zy1zcGRpZmluLmM6IEluIGZ1bmN0
aW9uIOKAmGF4Z19zcGRpZmluX3dyaXRlX21vZGVfcGFyYW3igJk6CmluY2x1ZGUvbGludXgvYml0
cy5oOjI2OjI4OiB3YXJuaW5nOiBjb21wYXJpc29uIG9mIHVuc2lnbmVkIGV4cHJlc3Npb24KPCAw
IGlzIGFsd2F5cyBmYWxzZSBbLVd0eXBlLWxpbWl0c10KCkNhc3Qgd2lkdGggdG8gYW4gaW50IHRv
IGF2b2lkIGNoZWNraW5nIGlmIGFuIHVuc2lnbmVkIHZhbHVlIGlzIGxvd2VyCnRoYW4gemVyby4K
ClNpZ25lZC1vZmYtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2Fy
dEBsaW51eC5pbnRlbC5jb20+Ci0tLQogc291bmQvc29jL21lc29uL2F4Zy1zcGRpZmluLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9zb3VuZC9zb2MvbWVzb24vYXhnLXNwZGlmaW4uYyBiL3NvdW5kL3NvYy9tZXNvbi9h
eGctc3BkaWZpbi5jCmluZGV4IGQwZDA5Zjk0NWI0OC4uNWZhNDExZDRlOTg1IDEwMDY0NAotLS0g
YS9zb3VuZC9zb2MvbWVzb24vYXhnLXNwZGlmaW4uYworKysgYi9zb3VuZC9zb2MvbWVzb24vYXhn
LXNwZGlmaW4uYwpAQCAtMTU0LDcgKzE1NCw3IEBAIHN0YXRpYyB2b2lkIGF4Z19zcGRpZmluX3dy
aXRlX21vZGVfcGFyYW0oc3RydWN0IHJlZ21hcCAqbWFwLCBpbnQgbW9kZSwKIAlyZWcgPSBvZmZz
ZXQgKiByZWdtYXBfZ2V0X3JlZ19zdHJpZGUobWFwKSArIGJhc2VfcmVnOwogCXNoaWZ0ID0gd2lk
dGggKiAobnVtX3Blcl9yZWcgLSAxIC0gcmVtKTsKIAotCXJlZ21hcF91cGRhdGVfYml0cyhtYXAs
IHJlZywgR0VOTUFTSyh3aWR0aCAtIDEsIDApIDw8IHNoaWZ0LAorCXJlZ21hcF91cGRhdGVfYml0
cyhtYXAsIHJlZywgR0VOTUFTSygoaW50KXdpZHRoIC0gMSwgMCkgPDwgc2hpZnQsCiAJCQkgICB2
YWwgPDwgc2hpZnQpOwogfQogCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
