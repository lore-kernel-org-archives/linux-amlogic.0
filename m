Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37B1CA1015
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Sep 2025 03:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:From:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AqlKKOL9w1vZzKkgFparl3WU+pzNeZyBR0URE9btsN0=; b=NBmFuwclFUtEBC
	yctpNSPj6WfDHB+uQRy2A5ObLyFmhmLzIQmwlFnPpfdXHPa4G6J6WnQv6b1hBRQ7NZCCW0ggM0f70
	MshaLy2L56vESSS8tfgs1p6hvmGCV4B9n39iQG8BZrOoMyBpH+wuKIA0Vnvk5OYON44McPa+S9lN+
	BnuO2PqofVgvhGL9IwdcTrEt3Ts7LSv0+D4tVNSWxOgyY2EqCpA02mTFH6TqMbwyFGMy9MUZ4nziB
	s6LtS/M2LTjFFDdVlZDGgGzRPkPdZEtBVHJNhZO4kN2QiAiyvLkrLWVd+1ltVaRhmtSUeL4QBbg+N
	YpQLRIG55Dftz07ph4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0bo-00000008fRU-0sHX;
	Thu, 04 Sep 2025 03:26:00 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uty7b-000000080kH-472H
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Sep 2025 00:46:41 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-24cbd9d9f09so6123895ad.2
        for <linux-amlogic@lists.infradead.org>; Wed, 03 Sep 2025 17:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howtoinstallvpn-com.20230601.gappssmtp.com; s=20230601; t=1756946799; x=1757551599; darn=lists.infradead.org;
        h=list-id:list-unsubscribe-post:list-unsubscribe
         :content-transfer-encoding:mime-version:date:subject:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=COq9134/6b1iRxYNYsuCHjpInRjQ1zBr/ctbjEK/gDY=;
        b=B6A4F25/UfwLbnaS0u1buIvVsIZcMWC6ASWD2W6ktODiGbBWlSsusoLmQFM16gXoMK
         04DjVrBzzb7oErzg3Q5VDC9cpe5f+kodT79Adueah78BNc1Oe+kxg+gTPWk/q0lCA4fH
         HAQueVGm3v2Eq9icY5XKRVW8n3mREhqF5hu1VCjcj60J9fEzy9X0p1KrYU41BR5SH2wj
         PgXGccpbeKvJGWDzlt2Heaw8+pQAvUdcXj5d8UisyzUH8vLeDPr1AYs1FDuc4mh2dPCL
         Ne0eK6ouxd1jw9uYIbXwX5sKufStEhoIOIqGwKNV/LmU2ko1m5rZM5rXxjuCZQiABSYC
         ix5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756946799; x=1757551599;
        h=list-id:list-unsubscribe-post:list-unsubscribe
         :content-transfer-encoding:mime-version:date:subject:to:from
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COq9134/6b1iRxYNYsuCHjpInRjQ1zBr/ctbjEK/gDY=;
        b=rEo5y7IblJxgYh54KDOIvlzTAH9o0bCCZYu8gRaNomEvw6Oh+RkwGEDz4JuagDuTSA
         zexJZf3RtVwz1yKGopoKqbCgcHdNsti+/rFYSOEEyvVD4Bgmi/7G2irOyK0Wfv9MAtav
         itzdNrSAnzvN5q4UAHzUyFo3o1MdJduIY7S+6Wk7GtJ+3hmsblYCSS13Fpsttj29+M85
         hZ/2YV9oAVwdDJkY10efIf9SBqbHgP7exncdnsntBwFG1OwVYgOPLikVAhFTktMOwQEk
         7H3FlalnMpNCjwZ72zREraoL32vHtmd6siS6wjHYFAsXCkMELO4YdIBEnrRl5krNhUld
         YgvQ==
X-Gm-Message-State: AOJu0Ywvta4EYkUsD9qLQqE6odCk2dTXxksqkSjmoayuXVWOL2l/94gW
	fojCE485sb9QLA0TxFV57ySXdVkBIXOVXQIV85gYRWbYc7SfHKhtclXmLNzvlOTCl6YQWEcowgY
	7IbJn18VNmfgIsQ==
X-Gm-Gg: ASbGncuaHXYBfvz/aFaxKwGa6JEzsWIIzu1DF/ClMIEzwqI0iqVcgDXMNkzf9gM20bd
	St86D8Er/JTo6hLRQoIqTEhutxmgRXRuVHzOKwQtPmfPMDGI2obOEy4UoDRyGWLzDTHvKox+GHR
	7QqiDTnrMzpI0PR08H4x+HFUZ708h1Q7NwFjujjgUAp4mGI/vBsOERXuiDr080VDamPC5xHlqAK
	VefY48xRLRwKZrFYpzuK+RLaLl5P/zC9khPapUR+p8Ixs1kIfmI/Ncg1dhp44LN3hIqTyjgJAUg
	P4GzuhUNr2KJ8fKsUxgqfvXkse8GgGUNX7IlsZ2DpyC8Bb0GbVkvzo1u+e4H9xixv8FzZ54CvOg
	Uz6DngGxaRLOHSodseRJGcp2Y1p9zsosf30LrEdGFXIoHF0u089pAcUIW1Mxxu8Z64n4=
X-Google-Smtp-Source: AGHT+IEfJP992IWSS7sxJJKSUVxGJ4UKjtjztdu9itlbuP3CVWR0tTilVg3n15Kk4M6I+HV4vrpubQ==
X-Received: by 2002:a17:902:e5d0:b0:24b:1766:cc70 with SMTP id d9443c01a7336-24b1766d2d6mr100877865ad.39.1756946798203;
        Wed, 03 Sep 2025 17:46:38 -0700 (PDT)
Received: from vjlrtcdoci.de (ip68-111-250-61.sd.sd.cox.net. [68.111.250.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cbe170977sm5829045ad.42.2025.09.03.17.46.37
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Sep 2025 17:46:37 -0700 (PDT)
Message-ID: <20211203000000.144721552.1000.477867@mkrm.rakuten.com>
From: =?utf-8?B?5qCq5byP44Oh44Oz44K/44O8IOS9kOiXpCDmhY7lkL4=?= <noreply407@howtoinstallvpn.com>
To: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Subject: =?utf-8?B?44CQ6YCf5aCx44CR5pys5pel44Gu5Y6z6YG46YqY5p+E44Os?=
	=?utf-8?B?44Od44O844OI77yI55+t5pyf5o6o5aWo77yJ?=
Date: Wed, 03 Sep 2025 20:46:33 +0800
X-Priority: 3
MIME-Version: 1.0
X-Z-SRV: Company=%E6%A5%BD%E5%A4%A9%E3%82%B0%E3%83%AB%E3%83%BC%E3%83%97;surl=https://corp.rakuten.co.jp;comp_siu=https://s.yimg.jp/images/mail/companymark/rakuten/;
Received: from mu-deliverer-felix-release (unknown [100.117.66.224])
X-Yahoo-Newman-Property: optinmailpf
X-Yahoo-Newman-Id: 6f76f3f8-0709-438a-8a56-6885387a3a34
X-yahoo-newman-expires: 1756134000
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_174640_125174_75F6227B 
X-CRM114-Status: UNSURE (   2.21  )
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

5bmz57Sg44KI44KK44GK5LiW6Kmx44Gr44Gq44Gj44Gm44GK44KK44G+44GZ44CCDQrmoKrlvI/j
g6Hjg7Pjgr/jg7zkvZDol6Qg5oWO5ZC+44Gn44GZ44CCDQoNCvCfk4wg5pys5pel44Gu5o6o5aWo
77yI5YSq6Imv6YqY5p+E77yJIOKAlCAyMDI15bm0OeaciDTml6UNCumKmOafhO+8mu+8iDQwMDXv
vInkvY/lj4vljJblraYNCg0K4pagIOaOqOWlqOiyt+S7mOODrOODs+OCuO+8mjQ0MOOAnDQ3MOWG
hg0K4pagIOaQjeWIh+OCiuebruWuie+8iOWPguiAg++8ie+8mjM4MOWGhg0K4pagIOWIqeebiueb
ruaome+8mg0K56ys5LiA55uu5qiZ77yaNDgw5YaGDQrnrKzkuoznm67mqJnvvJo1NTDlhoYNCg0K
4pagIOaOqOWlqOeQhueUse+8iOimgeeCue+8iQ0K44O75L2P5Y+L5YyW5a2m44Gv44CM57eP5ZCI
5YyW5a2m44CN44GL44KJ44CM6auY5LuY5Yqg5L6h5YCk5p2Q5paZ44Gu44OG44Kv44OO44Ot44K4
44O85LyB5qWt44CN44G444Gu5aSJ6Z2p44KS6YCy44KB44Gm44GE44G+44GZ44CCDQrjg7syMDI0
5bm044Gu5LiA5pmC55qE44GqSVTkuovmpa3muJvmkI3jga/nn63mnJ/nmoTjgarjg43jgqzjg4bj
gqPjg5bopoHntKDjgajjgZfjgabnuZTjgorovrzjgb7jgozjgabjgYrjgorjgIHml6LjgavluILl
oLTjga/kuIDlrprnqIvluqbnuZTjgorovrzjgb/muIjjgb/jgajliKTmlq3jgZfjgb7jgZnjgIIN
CuODu+WNiuWwjuS9k+adkOaWmeOBruWbveeUo+WMluODi+ODvOOCuuOChOWMu+eZguWIhumHjuOB
p+OBruaIkOmVt+OBjOOAgealree4vuWbnuW+qeOBqFJPReWbnuW+qeOBruWOn+WLleWKm+OBq+OB
quOCi+imi+i+vOOBv+OBp+OBmeOAgg0K44O754++5Zyo44Gu5qCq5L6h44Gv55u45a++55qE44Gr
5Ymy5a6J44Go6KmV5L6h44Gn44GN44CB44OG44Kv44OL44Kr44Or6Z2i44Gn44KC5LiK5piH44OI
44Os44Oz44OJ44GM56K66KqN44Gn44GN44KL54q25rOB44Gn44GZ44CC55+t5pyf44Cc5Lit5pyf
44Gn44Gu5LiK5piH5L2Z5Zyw44KS5pyf5b6F44GX44Gm44GE44G+44GZ44CCDQoNCuKWoCDmipXo
s4fliKTmlq3jga7jg53jgqTjg7Pjg4gNCuODu+acrOaOqOWlqOOBr+efreacn+OBrui/hemAn+OB
quWvvuW/nO+8iOW9k+aXpeOAnOaVsOWWtualreaXpe+8ieOCkuaDs+WumuOBl+OBpuOBhOOBvuOB
meOAgg0K44O744Oq44K544Kv566h55CG77yI5pCN5YiH44KK6Kit5a6a77yJ44Gv5b+F44Ga6KGM
44Gj44Gm44GP44Gg44GV44GE44CCDQoNCvCflJQg5pys5pel5Lit44Gu6LO85YWl44KS44GK5Yun
44KB44GX44G+44GZ44CCDQrml6LjgavjgZTos7zlhaXmuIjjgb/jga7mlrnjga/jgIHos7zlhaXn
lLvpnaLvvIjjgb7jgZ/jga/kv53mnInnlLvpnaLvvInjga7jgrnjgq/jg6rjg7zjg7Pjgrfjg6fj
g4Pjg4jjgpJMSU5F44Gn6YCB5LuY44GP44Gg44GV44GE44CC55uu5qiZ5L6h5qC85Yiw6YGU5pmC
44Gr6L+F6YCf44Gr5Yip55uK56K65a6a44Gu44K/44Kk44Of44Oz44Kw44KS44GU5qGI5YaF44GE
44Gf44GX44G+44GZ44CCDQoNCuKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKU
geKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgeKUgQ0K4pagIOeEoeaW
meOBrumKmOafhOmFjeS/oeODu+WAi+WIpeebuOirh++8iExJTkXvvInjgavjgaTjgYTjgabvvIjj
gZTmoYjlhoXvvIkNCuengeOBr+aXpeOAheOAgeWOs+mBuOmKmOafhOOBruWIhuaekOOChOWjsuiy
t+OCv+OCpOODn+ODs+OCsOOBrumFjeS/oeOCkkxJTkXjgafooYzjgaPjgabjgYTjgb7jgZnjgIIN
CkxJTkXjgavjgZTnmbvpjLLjgYTjgZ/jgaDjgY/jgajjgIHkuIvoqJjjga7jgrXjg7zjg5Pjgrnj
gpLnhKHmlpnjgaflj5fjgZHjgonjgozjgb7jgZnjgIINCg0K44O755+t5pyf5oCl6aiw6YqY5p+E
44Gu6YCf5aCx77yI5pyd44Kk44OB6YWN5L+h77yJDQrjg7vkuK3plbfmnJ/jga7miJDplbfmoKrj
g5Tjg4Pjgq/jgqLjg4Pjg5cNCuODu+mKmOafhOOBlOOBqOOBruiyt+OBhOODu+WjsuOCiuODu+aQ
jeWIh+OCiuOBruebruWuieaPkOekug0K44O75YCL5Yil55u46KuH77yI5YWI552A44O76ZmQ5a6a
5p6g77yJ44KE6YCf5aCx44Gu5YSq5YWI5qGI5YaFDQoNCuKWoCDlj4vjgaDjgaHov73liqDvvIjj
gZnjgZDnmbvpjLLlj6/og73vvIkNCkxJTkXpgKPntaHlhYjvvJpodHRwczovL2xpbmUubWUvdGkv
cC9HWnBaTXZydjhLDQpMSU5FIElE77yadjA5MDg0DQoNCuKAu+WFrOW8j0xJTkXjgbjnmbvpjLLj
gYTjgZ/jgaDjgZHjgozjgbDjgIHku6XpmY3jga/jgZPjgaHjgonjgafov4XpgJ/jgavjgZTmoYjl
hoXjgZfjgb7jgZnjgIINCuKAu+WIneWbnuOBr+ewoeWNmOOBquiHquW3see0ueS7i++8iOS/neac
iemKmOafhOODu+aKleizh+OCueOCv+OCpOODq+OBquOBqe+8ieOCkuOBiumAgeOCiuOBj+OBoOOB
leOBhOOAgg0KDQrjgZTkuI3mmI7ngrnjgoTlgIvliKXnm7joq4fluIzmnJvjga7mlrnjga/jgIFM
SU5F44Gr44Gm44GK5rCX6Lu944Gr44GU6YCj57Wh44GP44Gg44GV44GE44CCDQrjgZ3jgozjgafj
ga/jgIHoia/jgYTjg4jjg6zjg7zjg4njgpLjgYrnpYjjgorjgZfjgabjgYrjgorjgb7jgZnjgIIN
Cg0K5qCq5byP44Oh44Oz44K/44O8IOS9kOiXpCDmhY7lkL4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
