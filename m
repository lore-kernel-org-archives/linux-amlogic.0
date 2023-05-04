Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3411C77B7C
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 May 2023 21:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d3IMLd6nAyCuq+y8eeexHb2Vmhp5yJQ+atOsrUE3Mgs=; b=E1dbZ1wTUopgj/
	VqpOFuucfAK8kEQUQEncVj4pM3crKPLpplrl8FuZdY0oKKXeRYvLbGY4UJQC6GLEEUEQgXc8n/04d
	zQf/+wGSlt4S5DE6Ra/HoY/u+u7M28mz+44q8HY0rCQidGfnAYGaw13AZtI+kI4+tY2jtzfQqxfTw
	2HM/AWGc/WkyRo26Vq1rf8M1VzAYuppWFB9FxKcBZ5oWkY1KgyR6BNXdK3hRL2j92m11aYNMosEr0
	BdFMiSJ5xIgd6fDWOmIO9PVVbZT4s900NqEUfeEFtZrNUx5Lvl8LFzhxhW+VsaqiZkiCHHc+vk0hD
	eam6T9hi2LD9K/B521Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puggV-0094mo-36;
	Thu, 04 May 2023 21:40:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puggU-0094mW-37
	for linux-amlogic@bombadil.infradead.org;
	Thu, 04 May 2023 21:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=0K0vp6Hrdr6rprmlW88AczO8LMzPogTZr7OWCcYdWGU=; b=XYmES8WjjoJhvjRhxqlvY3bONv
	Iu8XDML8sRtFWbl0tKSpr8Ter585aELhMFZ8zYPtTRXRJHpuRxI3+IScfENdb3MZNBnFHJ0OU4eEX
	xF5sLfITJv1z3fF0C7PQDEe37xK6G7g02lbUYidd9jjeq8rjFgeetVim1O5m3ejg3Q7OKJ7zKTGL1
	oe2Jl3axyiNR8otUzM/b/kFeF8aNR8Ge1CcMw8JPwR9/ZN0syE8TmdqKC/zbrr4T/hh7GUnTW/Exf
	LyG8TxqJHMxF7ZsL4qKusCipEPlN5NcPgLu96s0Vq0RxteFxqmjWd/yfCBVaguEDaeLFLVxqQQ0hS
	BZCI5RfQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puetP-001ovV-2q
	for linux-amlogic@lists.infradead.org;
	Thu, 04 May 2023 19:45:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1puet3-0007eG-9l; Thu, 04 May 2023 21:45:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1puet1-0018F4-3j; Thu, 04 May 2023 21:45:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1puet0-001JhD-03; Thu, 04 May 2023 21:45:06 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 00/18] remoteproc: Convert to platform remove callback returning void
Date: Thu,  4 May 2023 21:44:35 +0200
Message-Id: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3577; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1MtyBZrEfa4B8pF3gNxwA18Zw/gtonyelyJbi+5OOFE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAm8mOKc9b0/danYJCdc61k/Zj773LlxBpbUo 6ju5XkgRdqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJvAAKCRCPgPtYfRL+ TiAxCAC1E8bg6I203hTsrJ3wz7jlhRBG+fWX/irJYFYhOed/WIzieyXyY+YZZGF/caBCQuNl/H2 EULhxcNYvCWrNjmBRI2piNO1ZuXOFto63zWyAhJTPQS/uggSvQbcfHNyOiYTw+E1WbsQfb/7M/0 EOM9LXiivD71kmmMXWccckezN3teMuquCvd1trbFddSRdCChxk18k0WQHX+OZeFnQkvAvVLiXSi XfaTFa/jEyblKAeusAq7t4qaGgHsVYZ5AwobaS9C6vwD4koSOeOH0MKmDL+JgToipyEaSNtlaAo VlUdExOqycUZ2WBDSRZ6kr8sK7G70uAtTEfaN/SN2UzfTwnZ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_204532_297054_BC65556C 
X-CRM114-Status: UNSURE (   9.56  )
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

SGVsbG8sCgp0aGlzIHBhdGNoIHNlcmllcyBhZGFwdHMgbW9zdCBwbGF0Zm9ybSBkcml2ZXJzIGJl
bG93IGRyaXZlcnMvcmVtb3RlcHJvYwp0byB1c2UgdGhlIC5yZW1vdmVfbmV3KCkgY2FsbGJhY2su
IENvbXBhcmVkIHRvIHRoZSB0cmFkaXRpb25hbCAucmVtb3ZlKCkKY2FsbGJhY2sgLnJlbW92ZV9u
ZXcoKSByZXR1cm5zIG5vIHZhbHVlLiBUaGlzIGlzIGEgZ29vZCB0aGluZyBiZWNhdXNlCnRoZSBk
cml2ZXIgY29yZSBkb2Vzbid0IChhbmQgY2Fubm90KSBjb3BlIGZvciBlcnJvcnMgZHVyaW5nIHJl
bW92ZS4gVGhlCm9ubHkgZWZmZWN0IG9mIGEgbm9uLXplcm8gcmV0dXJuIHZhbHVlIGluIC5yZW1v
dmUoKSBpcyB0aGF0IHRoZSBkcml2ZXIKY29yZSBlbWl0cyBhIHdhcm5pbmcuIFRoZSBkZXZpY2Ug
aXMgcmVtb3ZlZCBhbnlob3cgYW5kIGFuIGVhcmx5IHJldHVybgpmcm9tIC5yZW1vdmUoKSB1c3Vh
bGx5IHlpZWxkcyBhIHJlc291cmNlIGxlYWsuIE9uZSBkcml2ZXIgc3VmZmVyaW5nIGZyb20KdGhp
cyBwcm9ibGVtIChzM2MyNDEwKSBpcyBmaXhlZCBieSB0aGUgZmlyc3QgcGF0Y2guCgpCeSBjaGFu
Z2luZyB0aGUgcmVtb3ZlIGNhbGxiYWNrIHRvIHJldHVybiB2b2lkIGRyaXZlciBhdXRob3JzIGNh
bm5vdApyZWFzb25hYmx5IChidXQgd3JvbmdseSkgYXNzdW1lIGFueSBtb3JlIHRoYXQgdGhlcmUg
aGFwcGVucyBzb21lIGtpbmQgb2YKY2xlYW51cCBsYXRlci4KClRoZXJlIGlzIG9uZSBkcml2ZXIg
KGkuZS4gdGlfazNfZHNwX3JlbW90ZXByb2MuYykgdGhhdCBtaWdodCByZXR1cm4gYW4KZXJyb3Ig
Y29kZSBpbiAucmVtb3ZlKCkuIEkgZGlkbid0IGxvb2sgaW4gZGV0YWlsIGludG8gdGhpcyBkcml2
ZXIsIGJ1dAppZiB0aGF0IGVycm9yIGhhcHBlbnMsIHdlIGhhdmUgZXhhY3RseSB0aGUgYmFkIHNp
dHVhdGlvbiBkZXNjcmliZWQKYWJvdmUuIChOb3RlIHRoYXQga3Byb2MtPm1lbSBhbmQgdGhlIHJl
Z2lzdGVyIG1hcHBpbmcgZ29lcyBhd2F5LikKCkJlc3QgcmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUt
S8O2bmlnICgxOCk6CiAgcmVtb3RlcHJvYzogZGE4eHg6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcmVtb3RlcHJvYzogaW14X2RzcDogQ29udmVy
dCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAgICB2b2lkCiAgcmVtb3Rl
cHJvYzogaW14OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZAogIHJlbW90ZXByb2M6IGtleXN0b25lOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBj
YWxsYmFjayByZXR1cm5pbmcKICAgIHZvaWQKICByZW1vdGVwcm9jOiBtZXNvbl9teF9hb19hcmM6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrCiAgICByZXR1cm5pbmcgdm9pZAog
IHJlbW90ZXByb2M6IG10a19zY3A6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZwogICAgdm9pZAogIHJlbW90ZXByb2M6IG9tYXA6IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcmVtb3RlcHJvYzogcHJ1OiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHJlbW90ZXBy
b2M6IHFjb21fcTZ2NV9hZHNwOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjawog
ICAgcmV0dXJuaW5nIHZvaWQKICByZW1vdGVwcm9jOiBxY29tX3E2djVfbXNzOiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjawogICAgcmV0dXJuaW5nIHZvaWQKICByZW1vdGVwcm9j
OiBxY29tX3E2djVfcGFzOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjawogICAg
cmV0dXJuaW5nIHZvaWQKICByZW1vdGVwcm9jOiBxY29tX3E2djVfd2NzczogQ29udmVydCB0byBw
bGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sKICAgIHJldHVybmluZyB2b2lkCiAgcmVtb3RlcHJvYzog
cWNvbV93Y25zczogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5n
CiAgICB2b2lkCiAgcmVtb3RlcHJvYzogcmNhcjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICByZW1vdGVwcm9jOiB2aXJ0aW86IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcmVtb3RlcHJvYzogc3Q6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcmVt
b3RlcHJvYzogc3RtMzI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZyB2b2lkCiAgcmVtb3RlcHJvYzogd2t1cF9tMzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAgICB2b2lkCgogZHJpdmVycy9yZW1vdGVwcm9jL2RhOHh4
X3JlbW90ZXByb2MuYyAgICB8IDYgKystLS0tCiBkcml2ZXJzL3JlbW90ZXByb2MvaW14X2RzcF9y
cHJvYy5jICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYyAg
ICAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9yZW1vdGVwcm9jL2tleXN0b25lX3JlbW90ZXBy
b2MuYyB8IDYgKystLS0tCiBkcml2ZXJzL3JlbW90ZXByb2MvbWVzb25fbXhfYW9fYXJjLmMgICAg
IHwgNiArKy0tLS0KIGRyaXZlcnMvcmVtb3RlcHJvYy9tdGtfc2NwLmMgICAgICAgICAgICAgfCA2
ICsrLS0tLQogZHJpdmVycy9yZW1vdGVwcm9jL29tYXBfcmVtb3RlcHJvYy5jICAgICB8IDYgKyst
LS0tCiBkcml2ZXJzL3JlbW90ZXByb2MvcHJ1X3Jwcm9jLmMgICAgICAgICAgIHwgNiArKy0tLS0K
IGRyaXZlcnMvcmVtb3RlcHJvYy9xY29tX3E2djVfYWRzcC5jICAgICAgfCA2ICsrLS0tLQogZHJp
dmVycy9yZW1vdGVwcm9jL3Fjb21fcTZ2NV9tc3MuYyAgICAgICB8IDYgKystLS0tCiBkcml2ZXJz
L3JlbW90ZXByb2MvcWNvbV9xNnY1X3Bhcy5jICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvcmVt
b3RlcHJvYy9xY29tX3E2djVfd2Nzcy5jICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9yZW1vdGVw
cm9jL3Fjb21fd2Nuc3MuYyAgICAgICAgICB8IDYgKystLS0tCiBkcml2ZXJzL3JlbW90ZXByb2Mv
cmNhcl9ycHJvYy5jICAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvcmVtb3RlcHJvYy9yZW1v
dGVwcm9jX3ZpcnRpby5jICAgfCA2ICsrLS0tLQogZHJpdmVycy9yZW1vdGVwcm9jL3N0X3JlbW90
ZXByb2MuYyAgICAgICB8IDYgKystLS0tCiBkcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJfcnByb2Mu
YyAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvcmVtb3RlcHJvYy93a3VwX20zX3Jwcm9jLmMg
ICAgICAgfCA2ICsrLS0tLQogMTggZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgNzIg
ZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDFhNTMwNGZlY2VlNTIzMDYwZjI2ZTI3NzhkOWQ4
ZTMzYzA1NjJkZjMKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
