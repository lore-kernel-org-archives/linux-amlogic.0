Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C77C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 12:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lLjq9n9gi5kb0gVMkKdUmjMJ9pvhHD4hTej2eBAKsUg=; b=vM2OJGaM5pN8vm
	l+MH/ASMA8pxshX4eRnMFx4twBwY20DVkV9tr23c/4ssCWlI6VcF3VjzsveoRNnbC9fXxhmT1QRrU
	ksTwuBArBn4lGAbBX+mqDTIO7TisL0YqmbXySWjd4/Iv5UfmrFiP+Ps0XIVlIDyRx2q5r/ccYx3J3
	qge6awKhDQq2z2N/GxP1rtsWtNLfQ/6GZxpSoj/RezghtvKvz+hMi7AkLq2IFhxY0f6sFt9jUo2Xz
	al91mZDQT0n3Htt7p/6BHxzPJu+3JSIwC1C8mBiDUEZZnYGOrExk0OGr6whUWDVFJuFC+s4Z0CS6i
	y+zxgQ6Rw2VutKpcWhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhW4t-00DQDW-Fx; Thu, 21 Apr 2022 12:38:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhW4r-00DQC8-6k
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 12:38:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A9D161C19;
 Thu, 21 Apr 2022 12:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF961C385A5;
 Thu, 21 Apr 2022 12:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650544707;
 bh=mZV6jg/l9v3a4DV8qZCxa9Z/+AAEjmuRRW5FWEfYYuo=;
 h=From:To:Cc:Subject:Date:From;
 b=m1fxiOYIbqXSg5JhWQRv+nkjjXTs8A8YqaBY8AWR1I7yZIuxUQY3OYDlzCwHIai0B
 wo0Mc21vewiFVEm6g+R5dG4GW4VBGYjo+lr4XN9VLNlSeW3bY3JMDH1z98OoznCafY
 0knIwrKT8xI5Zwt5c2Se3TEowvo+2AOAofr7osuMvcwW9NWySTsP6oHYr22cDxLukZ
 KMk4nA8UBaX4lcG/D1X22+m50jultOsh3uY4t6JHVY8pT5p9W8i9Yjf6DV9CqE2T2H
 RzuVuADjy6aSrFPhAGSMpngksXqDFDU11LhdciSAEa1jP+o1CXvaSvvKOa3pY6HPyK
 cIGYIkJ6Aowzw==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 0/3] ASoC: meson: Fix mixer-test issues
Date: Thu, 21 Apr 2022 13:38:00 +0100
Message-Id: <20220421123803.292063-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; h=from:subject;
 bh=mZV6jg/l9v3a4DV8qZCxa9Z/+AAEjmuRRW5FWEfYYuo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiYVAnEt659yX5Ay9+sUz1/yC8FsbRHmNSuHpg+85+
 4jQbB5qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmFQJwAKCRAk1otyXVSH0LgtB/
 93r+28bvi6Qui21dUjq6Yq4usblNMvsL7Uc381POf8kjT0nGv+NHBL1ubIRBPJ6YguTap4PZTtXz7s
 mYbWEJmE2wiPXOokdlV3oHSQDFlzDkK4uIw6SEhDkS2o1vLlTWXuVksRSpX1I/RvwmAGc6W9kP3lMT
 ulZeeU+fWPZ1jhO4QhT55wmS0Vga/PGsYKSo3dsCIwffRr9xQrGeBMqM98VOz6YGoHYxDV1jqsY3kQ
 HYdBgt6HzfODUQ2rrxFKifd+xB5NsGRZIk/rFez93BL9vyj8KUZwy9iURogb67hvKkKF9WI8fHYZbB
 OOsb7L66jCnDLOKMoADG/Q9IH1uZGk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_053829_321897_3569FDC5 
X-CRM114-Status: GOOD (  10.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

These patches fix event generation issues in the custom controls in the
Meson drivers detected by mixer-test and by inspection once I saw the
pattern in these drivers. I'm also seeing other failures due to these
controls having invalid values, eg:

# # AIU ACODEC SRC.0 value 3 more than item count 3

but without documentation I'm not sure how to interpret/fix these -
either the value should be fixed up on startup or there should be an
extra value there (disconnected possibly?).

Mark Brown (3):
  ASoC: meson: Fix event generation for AUI ACODEC mux
  ASoC: meson: Fix event generation for AUI CODEC mux
  ASoC: meson: Fix event generation for G12A tohdmi mux

 sound/soc/meson/aiu-acodec-ctrl.c | 2 +-
 sound/soc/meson/aiu-codec-ctrl.c  | 2 +-
 sound/soc/meson/g12a-tohdmitx.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)


base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
