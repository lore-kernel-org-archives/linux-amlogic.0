Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91499C41535
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Dec 2023 14:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pIrHtl/kMgTWE5X2lVxu3tfeKS7u/WiFk8X7+byxTfM=; b=ypS0MV6Gsr8dSj
	H720HM6+paFJeGMUuiT/mY7AR/Kc2B/nHyehdBO5GcdGEn2HfGIkX/+Chj0P6kqm74YYsonrUiP65
	XtSh1hf8SpxC716tHz5JZ1QKGqc84nsGfYqP+Mtd0Ayoz+yT4uWgPS7wjMiIdvtPRcCOgj2UncC0P
	QJrGwt23Hgdiv+amUMm8kWIjaUWAodaFsxV8pMxLOmDuIi8vJFrieMfISV2iJPc1dnvui569VgNhi
	S60GLG33WqXTzCTGA0onxr0vIz8I6kgYFDzk2q54S2xNdM8hDfe/seAFDZn9yYN2UGv2qQ2nC0LHX
	xb16vygKl5aPkkdLde4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8jP-003T6R-1b;
	Fri, 15 Dec 2023 13:59:59 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8j5-003SpC-1L
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Dec 2023 13:59:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rE8iy-0002lK-KK; Fri, 15 Dec 2023 14:59:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rE8it-00G2ZD-Fu; Fri, 15 Dec 2023 14:59:27 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rE8it-003cBz-4n; Fri, 15 Dec 2023 14:59:27 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Frank Li <Frank.li@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Khuong Dinh <khuong@os.amperecomputing.com>
Subject: [PATCH 00/18] perf: Convert to platform remove callback returning void
Date: Fri, 15 Dec 2023 14:59:00 +0100
Message-ID: <cover.1702648124.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3618; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=QIF36TPLiswSJ7BGiTaGhS7zuJ523QsVTA+4ETPdeHY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlfFukmiA7JF09OlxcCekWHX8K7N+brb2dL8yu1 L79tE8736eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXxbpAAKCRCPgPtYfRL+ Thd3B/9bi37yHbyCmxtoBnTyzghErF03a3MQ2kLvT2WmB6Vq6D8LnRwzOn4qBxY8ZfeDwdwKqld VmyWYR4z12b2U0+t6+ECIYcIjWxvDKcBiUJSS79pIL6fT0UeHQ4H2od/hSZnok7vIJ6fJa6XtqM Zl+rLWPBfpQmhBkomYlmL8hSpsWm+NSe3gKOlCV6mjshMhP9BUbBTKxrfHgYWlBrvaBZMZ2pLPL ZqQvKMYTRYvzctEkxL+nfaZrX+/Hd3Z2fsxNMGprvpEDQQcQJjPId5k36TG+jic7RZVP3M93Oh2 /DnXMSYbdraUhMvDc20qEUTd8vLV2/RzXtBaIw/o0ZZplz3k
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_055939_468463_F21E457A 
X-CRM114-Status: UNSURE (   8.68  )
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

SGVsbG8sCgp0aGlzIHNlcmllcyBjb252ZXJ0cyBhbGwgZHJpdmVycyBiZWxvdyBkcml2ZXJzL3Bl
cmYgdG8gdXNlCi5yZW1vdmVfbmV3KCkuIFNlZSBjb21taXQgNWM1YTc2ODBlNjdiICgicGxhdGZv
cm06IFByb3ZpZGUgYSByZW1vdmUKY2FsbGJhY2sgdGhhdCByZXR1cm5zIG5vIHZhbHVlIikgZm9y
IGFuIGV4dGVuZGVkIGV4cGxhbmF0aW9uIGFuZCB0aGUKZXZlbnR1YWwgZ29hbC4gVGhlIFRMO0RS
OyBpcyB0byBtYWtlIGl0IGhhcmRlciBmb3IgZHJpdmVyIGF1dGhvcnMgdG8KbGVhayByZXNvdXJj
ZXMgd2l0aG91dCBub3RpY2luZy4KCkkgYmFzZWQgdGhlIHBhdGNoZXMgb24gdG9kYXkncyBuZXh0
LCBJIGhhZCB0byByZXZlcnQgY29tbWl0cyAKMzExNWVlMDIxYmZiICgiYXJtNjQ6IHBlcmY6IElu
Y2x1ZGUgdGhyZXNob2xkIGNvbnRyb2wgZmllbGRzIGluClBNRVZUWVBFUiBtYXNrIikgYW5kIDgx
NmMyNjc1NDQ0NyAoImFybTY0OiBwZXJmOiBBZGQgc3VwcG9ydCBmb3IgZXZlbnQKY291bnRpbmcg
dGhyZXNob2xkIikgdG8gY29tcGlsZSB0ZXN0IG9uIEFSQ0g9YXJtICh0aGlzIGlzIGEgcHJvYmxl
bSBpbgpuZXh0LCBub3QgaW4gbXkgcGF0Y2ggc2VyaWVzKS4KClRoaXMgaXMgbWVyZ2Ugd2luZG93
IG1hdGVyaWFsLiBBbGwgcGF0Y2hlcyBhcmUgcGFpcndpc2UgaW5kZXBlbmRlbnQgb2YKZWFjaCBv
dGhlciBzbyB0aGV5IGNhbiBiZSBhcHBsaWVkIGluZGl2aWR1YWxseS4gU3RpbGwgaXQgd291bGQg
YmUgZ3JlYXQKdG8gbGV0IHRoZW0gZ28gaW4gYWxsIHRvZ2V0aGVyLgoKQmVzdCByZWdhcmRzClV3
ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDE4KToKICBwZXJmOiBhbGliYWJhX3VuY29yZV9kcnc6IENv
bnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrCiAgICByZXR1cm5pbmcgdm9pZAogIHBl
cmY6IGFtbG9naWM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
ZyB2b2lkCiAgcGVyZjogYXJtLWNjaTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQKICBwZXJmOiBhcm0tY2NuOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJl
bW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHBlcmY6IGFybS1jbW46IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcGVyZjogYXJtX2NzcG11
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHBl
cmY6IGFybV9kbWM2MjA6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZyB2b2lkCiAgcGVyZjogYXJtX2RzdTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQKICBwZXJmOiBhcm1fc21tdXYzOiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHBlcmY6IGFybV9zcGU6IENvbnZl
cnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcGVyZjogZnNs
X2lteDhfZGRyOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZAogIHBlcmY6IGZzbF9pbXg5X2RkcjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQKICBwZXJmOiBoaXNpbGljb246IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcGVyZjogbWFydmVsbF9jbjEwa19k
ZHI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAg
cGVyZjogbWFydmVsbF9jbjEwa190YWQ6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkCiAgcGVyZjogcWNvbV9sMjogQ29udmVydCB0byBwbGF0Zm9ybSBy
ZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBwZXJmOiB0aHVuZGVyeDI6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcGVyZjogeGdlbmU6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCgogZHJp
dmVycy9wZXJmL2FsaWJhYmFfdW5jb3JlX2Ryd19wbXUuYyAgICAgICAgIHwgNiArKy0tLS0KIGRy
aXZlcnMvcGVyZi9hbWxvZ2ljL21lc29uX2cxMl9kZHJfcG11LmMgICAgICB8IDYgKystLS0tCiBk
cml2ZXJzL3BlcmYvYXJtLWNjaS5jICAgICAgICAgICAgICAgICAgICAgICAgfCA4ICsrKy0tLS0t
CiBkcml2ZXJzL3BlcmYvYXJtLWNjbi5jICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrLS0t
LQogZHJpdmVycy9wZXJmL2FybS1jbW4uYyAgICAgICAgICAgICAgICAgICAgICAgIHwgNSArKy0t
LQogZHJpdmVycy9wZXJmL2FybV9jc3BtdS9hcm1fY3NwbXUuYyAgICAgICAgICAgIHwgNiArKy0t
LS0KIGRyaXZlcnMvcGVyZi9hcm1fZG1jNjIwX3BtdS5jICAgICAgICAgICAgICAgICB8IDYgKyst
LS0tCiBkcml2ZXJzL3BlcmYvYXJtX2RzdV9wbXUuYyAgICAgICAgICAgICAgICAgICAgfCA2ICsr
LS0tLQogZHJpdmVycy9wZXJmL2FybV9zbW11djNfcG11LmMgICAgICAgICAgICAgICAgIHwgNiAr
Ky0tLS0KIGRyaXZlcnMvcGVyZi9hcm1fc3BlX3BtdS5jICAgICAgICAgICAgICAgICAgICB8IDUg
KystLS0KIGRyaXZlcnMvcGVyZi9mc2xfaW14OF9kZHJfcGVyZi5jICAgICAgICAgICAgICB8IDUg
KystLS0KIGRyaXZlcnMvcGVyZi9mc2xfaW14OV9kZHJfcGVyZi5jICAgICAgICAgICAgICB8IDYg
KystLS0tCiBkcml2ZXJzL3BlcmYvaGlzaWxpY29uL2hpc2lfdW5jb3JlX2NwYV9wbXUuYyAgfCA1
ICsrLS0tCiBkcml2ZXJzL3BlcmYvaGlzaWxpY29uL2hpc2lfdW5jb3JlX2RkcmNfcG11LmMgfCA1
ICsrLS0tCiBkcml2ZXJzL3BlcmYvaGlzaWxpY29uL2hpc2lfdW5jb3JlX2hoYV9wbXUuYyAgfCA1
ICsrLS0tCiBkcml2ZXJzL3BlcmYvaGlzaWxpY29uL2hpc2lfdW5jb3JlX2wzY19wbXUuYyAgfCA1
ICsrLS0tCiBkcml2ZXJzL3BlcmYvaGlzaWxpY29uL2hpc2lfdW5jb3JlX3BhX3BtdS5jICAgfCA1
ICsrLS0tCiBkcml2ZXJzL3BlcmYvaGlzaWxpY29uL2hpc2lfdW5jb3JlX3NsbGNfcG11LmMgfCA1
ICsrLS0tCiBkcml2ZXJzL3BlcmYvbWFydmVsbF9jbjEwa19kZHJfcG11LmMgICAgICAgICAgfCA1
ICsrLS0tCiBkcml2ZXJzL3BlcmYvbWFydmVsbF9jbjEwa190YWRfcG11LmMgICAgICAgICAgfCA2
ICsrLS0tLQogZHJpdmVycy9wZXJmL3Fjb21fbDJfcG11LmMgICAgICAgICAgICAgICAgICAgIHwg
NSArKy0tLQogZHJpdmVycy9wZXJmL3RodW5kZXJ4Ml9wbXUuYyAgICAgICAgICAgICAgICAgIHwg
NSArKy0tLQogZHJpdmVycy9wZXJmL3hnZW5lX3BtdS5jICAgICAgICAgICAgICAgICAgICAgIHwg
NiArKy0tLS0KIDIzIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDgxIGRlbGV0aW9u
cygtKQoKYmFzZS1jb21taXQ6IDE3Y2I4YTIwYmRlNjZhNTIwYTJjYTdhYWQxMDYzZTFjZTczODIy
NDAKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
