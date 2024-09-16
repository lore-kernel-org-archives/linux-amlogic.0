Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484A0C3ABB2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 07:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6QjUf/6r5EvhGo1vUt4TlPGTweHHT133AOIudMcNzQ8=; b=ERYu+AYR9RQluE
	IYAm0ou3fUxF/JLyVdZDzgVyJNCBsw51Lb70zQ/saxBSB6583tO80FKR/EwDcTHRApMZn96IjQ7Yj
	jvuiMpcv+CsQffzx6thpbIlp65tpkZq5GTBDW/q5kfPmvWVsmOQGKAewS8ryAgIbQBjEfOosdFVUb
	gJO7yeT67rXEW8LYvmTUFwgzCcX3TpUu8ogteWuMbZ1yOk2mAgUbpRuoT2jVr8imut10sdwwdtubb
	JFxHYjVa3hBFEeThCiv9LNH0Vjz9QcpoFskxhonb0bWa748EelOSGFQGj6w4D7A51mKlEVFRilzHy
	GpEjovFBZG1LqvdYZRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6Om-00000003LCx-0zLv;
	Mon, 16 Sep 2024 07:43:52 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6Oj-00000003LAy-0f5X
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 07:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726472629; x=1758008629;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=69UUwBAZ4rDPxmd5C0S5dgaXwBaxCU0cRIu3YPKdlL4=;
  b=g29Zdc/42aw34YsDPG1kIpUMpaal3BuObg2r1ucvQv3w2TXaqYYeG3KY
   qrU+EKd9SLWdZ0h7Y+8r5XXeKPYsYz59fJuylEK45ZUabaeKQXqqDnJQ8
   +Nt13vuiuTJxqlIJsVsux0hNgfN7EHVj6x3MIQhmtXG0sXv92UUDcO1FL
   tkyOppcPBO39DUfMApmVHz7JRVMPveXYJb1IvqPWoRxWKWhSgFL3IwAT3
   xPJRia7NfOKx8VVwIpc/GM1L/JbbQfYVNb0sH4U83XcXa3TqS4rJctiNM
   hnKLgsrrbfn1UC/APZqVk9yMUgxgcW90qlj507ENr5nueCVWwNSH3ChKV
   A==;
X-CSE-ConnectionGUID: HeMvKAEdR1CqO4PJ8f8xTw==
X-CSE-MsgGUID: v2cDO1E9QkugIiXL20GAqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="35862510"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="35862510"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 00:43:47 -0700
X-CSE-ConnectionGUID: DURGps4IQyiXfv/iAvS5bg==
X-CSE-MsgGUID: 8YA9GgzyQ024+G4zPL7x4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68492719"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.249])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 00:43:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 6/8] drm/meson: dw-hdmi: annotate
 dw_hdmi_dwc_write_bits() with __maybe_unused
In-Reply-To: <CAFBinCDQzHkvo1tQxa2pcgBHngtiXyCgdbnr=9nW7xDHy0RLdg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <fdc82abdabed667fc85d278cfb03d19e5c472d7b.1725962479.git.jani.nikula@intel.com>
 <CAFBinCDQzHkvo1tQxa2pcgBHngtiXyCgdbnr=9nW7xDHy0RLdg@mail.gmail.com>
Date: Mon, 16 Sep 2024 10:43:41 +0300
Message-ID: <87zfo8cac2.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_004349_265701_428DDB53 
X-CRM114-Status: UNSURE (   6.51  )
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

T24gU3VuLCAxNSBTZXAgMjAyNCwgTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0
aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4gSGkgSmFuaSwKPgo+IE9uIFR1ZSwgU2VwIDEw
LCAyMDI0IGF0IDEyOjA44oCvUE0gSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4g
d3JvdGU6Cj4+Cj4+IEJ1aWxkaW5nIHdpdGggY2xhbmcgYW5kIGFuZCBXPTEgbGVhZHMgdG8gd2Fy
bmluZyBhYm91dCB1bnVzZWQKPj4gZHdfaGRtaV9kd2Nfd3JpdGVfYml0cygpLiBGaXggYnkgYW5u
b3RhdGluZyBpdCB3aXRoIF9fbWF5YmVfdW51c2VkLgo+Pgo+PiBTZWUgYWxzbyBjb21taXQgNjg2
M2Y1NjQzZGQ3ICgia2J1aWxkOiBhbGxvdyBDbGFuZyB0byBmaW5kIHVudXNlZCBzdGF0aWMKPj4g
aW5saW5lIGZ1bmN0aW9ucyBmb3IgVz0xIGJ1aWxkIikuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEph
bmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gSSBwcmVmZXIgZHJvcHBpbmcgdGhp
cyBmdW5jdGlvbiBmb3Igd2hpY2ggdGhlcmUncyBhIHBhdGNoIGFscmVhZHk6IFswXQoKRXZlbiBi
ZXR0ZXIsIHRoYW5rcyEKCkJSLApKYW5pLgoKPgo+Cj4gWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LWFtbG9naWMvMjAyNDA5MDgtcmVnbWFwLWNvbmZpZy1jb25zdC12MS0xLTI4ZjM0
OTAwNDgxMUBsaW5hcm8ub3JnLwoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
