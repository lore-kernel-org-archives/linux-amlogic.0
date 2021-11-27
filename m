Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6A9C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Nov 2021 07:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cCl+vSX4oB+oRnsGzhplFMajsptnDywrORMMMesTyhY=; b=3GLZxgyofoVZbZ
	ZG2M0u9Q3kAOL/fRVrL907IBifrGvETWPpWq0eKwn9ZFbMUJ6JXIkxgYLfQwHcOy2ySGwlvDsyXwB
	eYpCEXvk8x3Sl8LDjx2Cenrou22p7nZ72QSce3i51HK0BmuOSmJhTQG/K5yKnv/VJCTJw+c8f1Ikj
	wutjhyNGwP2KSQfKUWWAUYITAne8YkRU9Ke22VFuxTpVwVnkU5aK3F0s4tUkvEWgWrzm8hUHKV0ru
	kpCExPyA9VCOHjFnDvGjJKR9mDfvzLcgz2rZHp/spePx9DRF5sbhhadtEHfIXU+Cz6HAar5Fr0r7X
	6nICdjYB+LQlgio1VjrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqrnY-00D6Ck-TD; Sat, 27 Nov 2021 07:07:00 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqrnV-00D6Bw-Hz
 for linux-amlogic@lists.infradead.org; Sat, 27 Nov 2021 07:06:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id y8so8077425plg.1
 for <linux-amlogic@lists.infradead.org>; Fri, 26 Nov 2021 23:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telus.net; s=google;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject:content-transfer-encoding;
 bh=Jpqpw+5k0JG4B7cIALfJ1NUW46zzTfZ3Ld8sYWJVFh8=;
 b=Xn14GLWArxU3vs1NJuh9JPpeRpV/ZqKB2IYrhl9qzb62TzK5SUNeDDgpf7EJLFRW91
 F5YbPBvolCdek0XTWjlAorFRt6+Pt456oBSBLmd26UJ0YZHsai7asv7LYeUSz2qMfiDX
 p/HEwtZPVKPYrucbrRo1OuwK1ueEmisajYQMfV2wMH5KChyLjcm8jOHiXR1Tt1nbtJxX
 e5nZ2y4FxBaADmYQDAzN+w0+vY31WjsiUurW9M2yRxv8bVjDLSk8YxyNdrVP1wlDTtWn
 8cvcK92iE3NAFNdOAhmod93KtU7GRQSfnuZHgxY9paq91nASn+Ds5/6a0Iq8o2c8zLsr
 TJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=Jpqpw+5k0JG4B7cIALfJ1NUW46zzTfZ3Ld8sYWJVFh8=;
 b=3nb8fOBxJAsrub4RG6nvzBIhwHhZ/cLzp1kh3d4SEFZ0F29B1Ke3cXO5bIhbcBWROg
 3pd+dXpY4FipJcpSUZSZlWQbWzRe+wmToYCJEqqUe5JIyPGqVi+06/B2IYA1w+eNMVSN
 gHkvQ4z2cQHQLvx/jljaXPbwwitQf76hZ7glSfaN50/pgzLpZSmcEjghqid2ws90ymlh
 uhw7ro7uMRfKyWi3tbvhjjGfJqPG3BzUgiImZco6RFCtOT+a2O1W2M5+cN3gr3F+YwVP
 5d02VIn0VX4MV+Qy+1UXb4sZh8eAs0XySYmHpT7MLfdw2DjE7OfupMWrIJXV+nO+Ikp1
 R6oA==
X-Gm-Message-State: AOAM532E7Ndpg/sr5ZctxpuAILY4qhNZGGOCNReOdyBvYAwdpL/Ve+GC
 ZIWgiISk7bV3elrSSriS9K3opOkGf97yxQ==
X-Google-Smtp-Source: ABdhPJz4QxbdT0iuocxs5dFZ749jiRumu6tSEEfJjgunkgZzDTFFDTO3zEYerzsr+B8sPuvCwgvFOA==
X-Received: by 2002:a17:90b:1057:: with SMTP id
 gq23mr21385879pjb.203.1637996815127; 
 Fri, 26 Nov 2021 23:06:55 -0800 (PST)
Received: from [192.168.1.165] (d173-180-129-168.bchsia.telus.net.
 [173.180.129.168])
 by smtp.gmail.com with ESMTPSA id y4sm9880923pfi.178.2021.11.26.23.06.54
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 23:06:54 -0800 (PST)
Message-ID: <ba04a76e-377a-9cef-1539-634d27483d18@telus.net>
Date: Fri, 26 Nov 2021 23:06:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Content-Language: en-US
To: linux-amlogic@lists.infradead.org
From: E Honsch <honsch@telus.net>
Subject: YUV Display
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_230657_843373_32EA1B84 
X-CRM114-Status: UNSURE (   5.22  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SSd2ZSBiZWVuIHVzaW5nIGFuIE9Ecm9pZCBDMiBmb3Igb3VyIHJhY2UgY2FyIGRhc2hib2FyZCBh
bmQgd2UgZGVjaWRlZCAKdG8gdXBncmFkZSB0aGUgc2NyZWVuIHRvIGEgbW9yZSBkYXNoYm9hcmQg
ZnJpZW5kbHkgc2l6ZS4gV2UgZW5kZWQgdXAgCmdvaW5nIHdpdGggdGhpcyBvbmU6IGh0dHBzOi8v
d3d3LndhdmVzaGFyZS5jb20vd2lraS8xMS45aW5jaF9IRE1JX0xDRAoKV2hhdCB0aGV5IGRpZG4n
dCBtZW50aW9uIGlzIHRoYXQgaXMgb25seSB0YWtlcyBZVVYgZGF0YS4KCkFmdGVyIGRpZ2dpbmcg
YXJvdW5kIEkgZmlndXJlZCBvdXQgdGhhdCBZVVYgc2Nhbm91dCBpc24ndCB5ZXQgc3VwcG9ydGVk
IAppbiB0aGUgbWVzb24gZHJtLgoKSG93IGZhciBhd2F5IGZyb20gYmVpbmcgYWJsZSB0byBzdXBw
b3J0IFlVViBpcyB0aGUgY29kZSBjdXJyZW50bHk/wqAgRG9lcyAKdGhlIGRvY3VtZW50YXRpb24g
ZXhpc3QgdG8gaW1wbGVtZW50IHRoZSBmZWF0dXJlP8KgIElmIHRoZSBpbmZvcm1hdGlvbiBpcyAK
YXJvdW5kIEknZCB0YWtlIGEgc3RhYiBhdCBnZXR0aW5nIGl0IGdvaW5nIGlmIHNvbWVvbmUgcG9p
bnRzIG1lIGluIHRoZSAKcmlnaHQgZGlyZWN0aW9uLgoKVGhhbmtzLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
