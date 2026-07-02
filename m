Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F233C43602
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EgyG/36iMqC15sADLvt261TX0O5eYH5WdxqTEXItld0=; b=jNVkXJqW067l6k
	kNybWHVOlcymgOKI3pH7c4EN9unnLRAgp8EKYK1XOyZGzQXxxoPJDgTQNCCczLnUL0FZ7983kr+uY
	x9BXyVePzqe8Y7ts4LVFPDlhd+A+HdOKSC2UkEW1CVvn11vM+zxGbrHmFcSsKKlEoe6+ar/xbaviJ
	86f1iXzAT//RwILhLcqzAa05h0gAIzPUJfNO6sVuW0+KRO2TFC8SBHmKKEFtq0i1iGjaRNfmzSl2V
	AXa7+F6HFqFGTB+0z0ZNPqX6jfmJHagZmA8gRr8rM8Yn6p1oVZ0w10dGL8XMvDEIqPhFZD0HH4fAF
	MRbdDWSp93MMhqpqzCKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJks-00000004t6j-2rZh;
	Thu, 02 Jul 2026 15:55:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJkr-00000004t6D-0glc
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 15:55:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 99AAD601EE;
	Thu,  2 Jul 2026 15:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CD01F00A3A;
	Thu,  2 Jul 2026 15:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007708;
	bh=b2FoS1WU3V+E9qG7HlreOa3MaaAEncF5cvMCzetqeEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bbz0EazbDQjj8A928aixBobU49tx4UIV9tED6uFWIaqXtIC6AivdD1/dbir4mKuCS
	 KS8VpkAE75R2Af83m/fyDjBcnVM7B7WG0vvTvAfvJljPquq5OtTvGnXAeZAoRPsZeR
	 AL9TSBZS6L6i7E4tdlqvSeTDW5RJOD9Kntav6JzLYP8KipNYencLkIkioAMBX3i4n4
	 7dXP0X1VvtT5Kj5XwAxGpvmB5j5hAwk5Mp6GiIHDPx3hncsZok2r/KRq41m5/a5W1p
	 t0YsOcfT9UKQx33SOEXPPpPj1S/Cd/TfnWM0nwNXwLaBJ4Q0/i1jG25aikhPrnohev
	 i8wKHbtgu2wcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/11] cpu: Use sysfs_emit() for cpumask show
 callback
To: "Yury Norov" <ynorov@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev, linux-perf-users@vger.kernel.org, neil.armstrong@linaro.org, linux-cxl@vger.kernel.org
In-Reply-To: <20260702154725.185376-5-ynorov@nvidia.com>
References: <20260702154725.185376-1-ynorov@nvidia.com>
 <20260702154725.185376-5-ynorov@nvidia.com>
Date: Thu, 02 Jul 2026 15:55:07 +0000
Message-Id: <20260702155507.D0CD01F00A3A@smtp.kernel.org>
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

PiBzaG93X2NwdXNfYXR0cigpIGlzIGEgc3lzZnMgc2hvdyBjYWxsYmFjay4gVXNlIHN5c2ZzX2Vt
aXQoKSBhbmQKPiBjcHVtYXNrX3ByX2FyZ3MoKSB0byBlbWl0IHRoZSBtYXNrLgo+IAo+IFRoaXMg
cHJlcGFyZXMgZm9yIHJlbW92aW5nIGNwdW1hcF9wcmludF90b19wYWdlYnVmKCkuCj4gCj4gU2ln
bmVkLW9mZi1ieTogWXVyeSBOb3JvdiA8eW5vcm92QG52aWRpYS5jb20+CgpTYXNoaWtvIGhhcyBy
ZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoK
LS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8y
MDI2MDcwMjE1NDcyNS4xODUzNzYtMS15bm9yb3ZAbnZpZGlhLmNvbT9wYXJ0PTQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
