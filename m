Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C30C48297
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Feb 2024 18:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2zH34yKPKSXiROwupiA0LKma44tpbtMUY73KsWtgqU=; b=rz9tJooEnAsqW9
	IDzI13SewwDIDJuRS4TuT6DrajveR+Uv4oPP+4xyKPrAWPs70FdR7NUp0hZd38QBPqV3t/c65cIix
	DdMTj5i0nZNCn5+Q2ghT5rFJKUgX/LMX82yDJ0jybw2Beox8F1O21HFSbPKqPjQpUM5xdrVH0fDAM
	FQ3oeHYtJYE7LF4/sDVSnB9QCDsUM2ODVv97z2crIZVcgaB9KdJt9k5+Up+35pO0h/aoMx7ttwkOJ
	7BymNd419R+KPUQEs0WTvvH2vbRLYsyFYnJAHGG5gQ4CzB3TtxD1/xqBgCLb2LrYJJxph15mK+3IT
	pT9IBKo95bziz1Rar8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYVfL-00000000Fqf-38bf;
	Fri, 09 Feb 2024 18:31:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYVf3-00000000Fdt-1vnL;
	Fri, 09 Feb 2024 18:31:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA84362154;
	Fri,  9 Feb 2024 18:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A52C43394;
	Fri,  9 Feb 2024 18:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707503500;
	bh=2IlRMX/ieZtxo3cdQw6/VrlKIfCnRzjHLu40pTVewHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pwctSo9KPwrHWOplC+5/FYlnyyjRlGoxxhTeJNxK4sYB8TBw/HJprLy4bYSHDriOo
	 H1PUEmhNIlkZV4L85E5/8hOzjGc8MzoGd8wb4YwckaBc1nJ/00Kiez0QDL8KHpa4S0
	 WJ8FZLTBBO6p4apt6VI1GjFAU2f4Cnf2fBYmQ2kK4LLjh78Honq2VDmFJkiZWe5a+h
	 PS35cl4ywVzlFSXZqJspacolT1aswK3+W61ctNtSfvOR2npoyr4NWX3+kAB5hoW5AS
	 Tu+dkU8L3bpKs+HTY2SjolAR1CIICdNgZDQebquy6x4/nFpHXkLrlw2MJwELBxS0Pc
	 DIiJZEDgSBy3A==
From: Will Deacon <will@kernel.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Frank Li <Frank.li@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	Yicong Yang <yangyicong@hisilicon.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	NXP Linux Team <linux-imx@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 00/18] perf: Convert to platform remove callback returning void
Date: Fri,  9 Feb 2024 18:31:13 +0000
Message-Id: <170749437153.2624333.6691453190868131616.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1702648124.git.u.kleine-koenig@pengutronix.de>
References: <cover.1702648124.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_103141_789107_9D1CB71B 
X-CRM114-Status: GOOD (  10.57  )
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

T24gRnJpLCAxNSBEZWMgMjAyMyAxNDo1OTowMCArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gdGhpcyBzZXJpZXMgY29udmVydHMgYWxsIGRyaXZlcnMgYmVsb3cgZHJpdmVycy9wZXJm
IHRvIHVzZQo+IC5yZW1vdmVfbmV3KCkuIFNlZSBjb21taXQgNWM1YTc2ODBlNjdiICgicGxhdGZv
cm06IFByb3ZpZGUgYSByZW1vdmUKPiBjYWxsYmFjayB0aGF0IHJldHVybnMgbm8gdmFsdWUiKSBm
b3IgYW4gZXh0ZW5kZWQgZXhwbGFuYXRpb24gYW5kIHRoZQo+IGV2ZW50dWFsIGdvYWwuIFRoZSBU
TDtEUjsgaXMgdG8gbWFrZSBpdCBoYXJkZXIgZm9yIGRyaXZlciBhdXRob3JzIHRvCj4gbGVhayBy
ZXNvdXJjZXMgd2l0aG91dCBub3RpY2luZy4KPiAKPiBJIGJhc2VkIHRoZSBwYXRjaGVzIG9uIHRv
ZGF5J3MgbmV4dCwgSSBoYWQgdG8gcmV2ZXJ0IGNvbW1pdHMKPiAzMTE1ZWUwMjFiZmIgKCJhcm02
NDogcGVyZjogSW5jbHVkZSB0aHJlc2hvbGQgY29udHJvbCBmaWVsZHMgaW4KPiBQTUVWVFlQRVIg
bWFzayIpIGFuZCA4MTZjMjY3NTQ0NDcgKCJhcm02NDogcGVyZjogQWRkIHN1cHBvcnQgZm9yIGV2
ZW50Cj4gY291bnRpbmcgdGhyZXNob2xkIikgdG8gY29tcGlsZSB0ZXN0IG9uIEFSQ0g9YXJtICh0
aGlzIGlzIGEgcHJvYmxlbSBpbgo+IG5leHQsIG5vdCBpbiBteSBwYXRjaCBzZXJpZXMpLgo+IAo+
IFsuLi5dCgpBcHBsaWVkIHRvIHdpbGwgKGZvci1uZXh0L3BlcmYpLCB0aGFua3MhCgpbMDEvMThd
IHBlcmY6IGFsaWJhYmFfdW5jb3JlX2RydzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3dpbGwv
Yy8zYmM5ZDcxNzc1ZWUKWzAyLzE4XSBwZXJmOiBhbWxvZ2ljOiBDb252ZXJ0IHRvIHBsYXRmb3Jt
IHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvd2lsbC9jLzk0ODQzZjI2OWFiZApbMDMvMThdIHBlcmY6IGFybS1jY2k6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgaHR0cHM6
Ly9naXQua2VybmVsLm9yZy93aWxsL2MvNGRmM2JkZGY4NzA3ClswNC8xOF0gcGVyZjogYXJtLWNj
bjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICAg
ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3dpbGwvYy8wNzY3ZjFhNDg1MzIKWzA1LzE4XSBw
ZXJmOiBhcm0tY21uOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5p
bmcgdm9pZAogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvd2lsbC9jLzM5MDljYjNiNWY4
ZApbMDYvMThdIHBlcmY6IGFybV9jc3BtdTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3dpbGwv
Yy83OWRjMTU3MGIzMjIKWzA3LzE4XSBwZXJmOiBhcm1fZG1jNjIwOiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvd2lsbC9jL2NhMWUwMWM4ZDM0YQpbMDgvMThdIHBlcmY6IGFybV9kc3U6IENvbnZl
cnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgaHR0
cHM6Ly9naXQua2VybmVsLm9yZy93aWxsL2MvMDJkNzdhYzFhYzdlClswOS8xOF0gcGVyZjogYXJt
X3NtbXV2MzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZv
aWQKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3dpbGwvYy9kNjdjM2E2MWYwNjMKWzEw
LzE4XSBwZXJmOiBhcm1fc3BlOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayBy
ZXR1cm5pbmcgdm9pZAogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvd2lsbC9jL2U2M2Iz
YWVmMTg2YgpbMTEvMThdIHBlcmY6IGZzbF9pbXg4X2RkcjogQ29udmVydCB0byBwbGF0Zm9ybSBy
ZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3dpbGwvYy8xYmI2MzkzODJkM2YKWzEyLzE4XSBwZXJmOiBmc2xfaW14OV9kZHI6IENvbnZl
cnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgaHR0
cHM6Ly9naXQua2VybmVsLm9yZy93aWxsL2MvNzhkYTJhOTNiNTViClsxMy8xOF0gcGVyZjogaGlz
aWxpY29uOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZAogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvd2lsbC9jL2UwNzQ4NmE4MzJiYgpbMTQv
MThdIHBlcmY6IG1hcnZlbGxfY24xMGtfZGRyOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBj
YWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvd2ls
bC9jL2M4MDJiZDllMzU0ZgpbMTUvMThdIHBlcmY6IG1hcnZlbGxfY24xMGtfdGFkOiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvd2lsbC9jLzg2ZTg5NjNmOWRiYQpbMTYvMThdIHBlcmY6IHFjb21f
bDI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAg
ICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy93aWxsL2MvOGEyZTQzOGU3MTBjClsxNy8xOF0g
cGVyZjogdGh1bmRlcngyOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1
cm5pbmcgdm9pZAogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvd2lsbC9jL2Q0YzVjZWY3
M2IyNQpbMTgvMThdIHBlcmY6IHhnZW5lOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxs
YmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvd2lsbC9j
L2IwN2ViZThmMTQyOAoKQ2hlZXJzLAotLSAKV2lsbAoKaHR0cHM6Ly9maXhlcy5hcm02NC5kZXYK
aHR0cHM6Ly9uZXh0LmFybTY0LmRldgpodHRwczovL3dpbGwuYXJtNjQuZGV2CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
